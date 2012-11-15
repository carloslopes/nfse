require 'json'

module Nfse
  module Envio
    class Lote < Nfse::Base
      attr_accessor :id, :cod_cidade, :cnpj, :razao_social, :inscricao_municipal
      attr_writer :transacao, :versao, :metodo_envio
      attr_reader :rps

      def initialize(json = nil)
        @id  = "#{self.object_id}#{Time.now.to_i}"
        @rps = []

        if json
          attributes = JSON.parse(json)

          rps = attributes.delete('rps')
          rps.each { |data| self.rps << Rps.new(data) } if rps

          attributes.each do |k,v|
            send("#{k}=", v)
          end
        end
      end

      def transacao
        @transacao ||= 'true'
      end

      def versao
        @versao ||= '1'
      end

      def metodo_envio
        @metodo_envio ||= 'WS'
      end

      def qtd_rps
        rps.size
      end

      # Soma do valor de todos os serviços de cada RPS
      def valor_servicos
        rps.reduce(0) do |total,obj|
          total += obj.valor_servico
        end
      end

      # Soma do valor de todos as deduções de cada RPS
      def valor_deducoes
        rps.reduce(0) do |total,obj|
          total += obj.valor_deducao
        end
      end

      def data_inicio
        rps.first.data_emissao.strftime('%Y-%m-%d')
      end

      def data_fim
        rps.last.data_emissao.strftime('%Y-%m-%d')
      end

      def render_rps
        rps.reduce('') do |xml,obj|
          xml << obj.render
        end
      end
    end
  end
end
