require 'digest'

module Nfse
  module Envio
    class Rps < Nfse::Base
      include Virtus

      attribute :prestador, Prestador, default: lambda { |*_| Prestador.new }
      attribute :tomador, Tomador, default: lambda { |*_| Tomador.new }
      attribute :itens, Array[Item], default: lambda { |*_| Array.new }
      attribute :deducoes, Array[Deducao], default: lambda { |*_| Array.new }

      attribute :tipo, String, default: 'RPS'
      attribute :serie, String, default: 'NF'
      attribute :numero, Integer
      attribute :data_emissao, DateTime, default: lambda { |*_| DateTime.now }
      attribute :situacao, String

      attribute :serie_prestacao, Integer, default: 99
      attribute :cod_municipio_prestacao, String
      attribute :municipio_prestacao, String

      attribute :serie_rps_substituido, String
      attribute :num_rps_substituido, Integer
      attribute :num_nfse_substituida, Integer
      attribute :data_nfse_substituida, DateTime

      attribute :cod_atividade, String
      attribute :aliquota_atividade, Float
      attribute :tipo_recolhimento, String
      attribute :operacao, String, default: :default_operacao
      attribute :tributacao, String

      attribute :valor_pis, Float
      attribute :valor_cofins, Float
      attribute :valor_inss, Float
      attribute :valor_ir, Float
      attribute :valor_csll, Float

      attribute :aliquota_pis, Float
      attribute :aliquota_cofins, Float
      attribute :aliquota_inss, Float
      attribute :aliquota_ir, Float
      attribute :aliquota_csll, Float

      attribute :descricao, String
      attribute :motivo_cancelamento, String
      attribute :cnpj_intermediario, String

      # Rio de janeiro
      attribute :id, String, default: lambda { |rps,_| "#{rps.object_id}#{Time.now.to_i}" }
      attribute :optante_simples_nacional, Integer, default: 1
      attribute :incentivador_cultural, Integer, default: 2
      attribute :status, Integer, default: 1
      attribute :iss_retido, Integer, default: 2
      attribute :valor_iss, Float
      attribute :valor_outras_retencoes, Float, default: 0.0
      attribute :desconto_incondicionado, Float, default: 0.0
      attribute :desconto_condicionado, Float, default: 0.0

      def formatted_data_emissao
        data_emissao.strftime('%Y-%m-%dT%H:%M:%S')
      end

      def formatted_data_nfse_substituida
        data_nfse_substituida.strftime('%Y-%m-%d')
      end

      def assinatura
        Digest::SHA1.hexdigest(raw_signature)
      end

      def valor_deducao
        deducoes.reduce(0) do |total,deducao|
          total += deducao.valor
        end
      end

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

      # Attributes default values
      def default_operacao
        '1' if Nfse::Base.prefeitura == :rio_de_janeiro
      end

      private
        def raw_signature
          deducao = valor_deducao
          valor_servico_com_deducao = valor_servico - deducao

          signature = prestador.inscricao_municipal.rjust(11, '0')
          signature << serie.ljust(5)
          signature << numero.to_s.rjust(12, '0')
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
