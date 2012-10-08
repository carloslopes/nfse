require 'json'

module Nfse
  module Envio
    class Lote < Base
      attr_accessor :id, :cod_cidade, :cnpj, :razao_social
      attr_writer :transacao, :versao, :metodo_envio
      attr_reader :rps

      def initialize(json = '')
        @id  = "#{self.object_id}#{Time.now.to_i}"
        @rps = []

        unless json.empty?
          attributes = JSON.parse(json)

          rpses = attributes.delete('rps')
          rpses.each { |data| self.rps << Rps.new(data) } if rpses.is_a? Array

          super(attributes)
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
        rps.map{ |obj| obj.valor_servico }.reduce(:+)
      end

      # Soma do valor de todos as deduções de cada RPS
      def valor_deducoes
        rps.map{ |obj| obj.valor_deducao }.reduce(:+)
      end

      def data_inicio
        rps.first.data_emissao.strftime('%Y-%m-%d')
      end

      def data_fim
        rps.last.data_emissao.strftime('%Y-%m-%d')
      end
    end
  end
end
