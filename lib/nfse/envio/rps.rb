require 'digest'
require 'date'

module Nfse
  module Envio
    class Rps < Nfse::Base
      attr_accessor :id, :numero, :situacao, :serie_rps_substituido,
        :num_rps_substituido, :num_nfse_substituida, :data_nfse_substituida,
        :cod_atividade, :aliquota_atividade, :tipo_recolhimento,
        :cod_municipio_prestacao, :municipio_prestacao, :operacao,
        :tributacao, :valor_pis, :valor_cofins, :valor_inss, :valor_ir,
        :valor_csll, :aliquota_pis, :aliquota_cofins, :aliquota_inss,
        :aliquota_ir, :aliquota_csll, :descricao, :motivo_cancelamento,
        :cnpj_intermediario, :tipo, :serie, :serie_prestacao,
        :optante_simples_nacional, :incentivador_cultural, :status_rps,
        :iss_retido, :valor_iss, :valor_outras_retencoes,
        :desconto_incondicionado, :desconto_condicionado

      attr_reader :data_emissao, :prestador, :tomador, :itens, :deducoes

      def initialize(attributes = {})
        @id  = "#{self.object_id}#{Time.now.to_i}"
        @tipo = 'RPS' # RJ: 1 - RPS, 2 – Nota Fiscal Conjugada (Mista), 3 – Cupom
        @serie = 'NF'
        @serie_prestacao = '99'
        @operacao = '1' # RJ: 1 – Tributação no município, 2 - Tributação fora do município, 3 - Isenção, 4 - Imune, 5 –Exigibilidade suspensa por decisão judicial, 6 – Exigibilidade suspensa por procedimento administrativo
        @optante_simples_nacional = 1 # RJ: 1 = Sim, 2 = Não
        @incentivador_cultural = 2 # RJ: 1 = Sim, 2 = Não
        @status_rps = 1 # RJ: 1 = Normal, 2 = Cancelado
        @iss_retido = 2 # RJ: 1 = Sim, 2 = Não
        @valor_iss = 0.0
        @valor_outras_retencoes = 0.0
        @desconto_incondicionado = 0.0
        @desconto_condicionado = 0.0
        @data_emissao = DateTime.now
        @prestador = Prestador.new(attributes.delete('prestador'))
        @tomador   = Tomador.new(attributes.delete('tomador'))
        @itens     = []
        @deducoes  = []

        itens = attributes.delete('itens')
        itens.each { |data| self.itens << Item.new(data) } if itens

        deducoes = attributes.delete('deducoes')
        deducoes.each { |data| self.deducoes << Deducao.new(data) } if deducoes

        attributes.each do |k,v|
          send("#{k}=", v)
        end
      end

      # Atribui um valor para a data de emissao
      # rescue ArgumentError para quando for passado uma data inválida para o DateTime.parse
      def data_emissao=(value)
        @data_emissao = DateTime.parse(value.to_s)
      rescue ArgumentError
      end

      def formatted_data_emissao
        @data_emissao.strftime('%Y-%m-%dT%H:%M:%S')
      end

      def assinatura
        Digest::SHA1.hexdigest(raw_signature)
      end

      # Soma do valor de todas as deducoes
      def valor_deducao
        deducoes.reduce(0) do |total,deducao|
          total += deducao.valor
        end
      end

      # Soma do valor de todos os serviços
      def valor_servico
        itens.reduce(0) do |total,item|
          total += item.valor_total
        end
      end

      def render_deducoes
        deducoes.reduce('') do |xml,deducao|
          xml << deducao.render
        end
      end

      def render_itens
        itens.reduce('') do |xml,item|
          xml << item.render
        end
      end

      private
        def raw_signature
          deducao = valor_deducao
          valor_servico_com_deducao = valor_servico - deducao

          signature = prestador.inscricao_municipal.rjust(11, '0')
          signature << serie.ljust(5)
          signature << numero.rjust(12, '0')
          signature << data_emissao.strftime('%Y%m%d')
          signature << tributacao.ljust(2)
          signature << situacao
          signature << (tipo_recolhimento == 'A' ? 'N' : 'S')
          signature << valor_servico_com_deducao.to_s.rjust(15, '0')
          signature << deducao.to_s.rjust(15, '0')
          signature << cod_atividade.rjust(10, '0')
          signature << tomador.cnpj.rjust(14, '0')
        end
    end
  end
end
