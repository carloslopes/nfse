require 'json'

module Nfse
  module Envio
    class Lote < Nfse::Base
      include Virtus

      attribute :rps, Array[Rps], default: lambda { |*_| Array.new }

      attribute :id, String, default: lambda { |lote,_| "#{lote.object_id}#{Time.now.to_i}" }
      attribute :cod_cidade, String
      attribute :cnpj, String
      attribute :razao_social, String
      attribute :transacao, String, default: 'true'
      attribute :versao, Integer, default: 1
      attribute :metodo_envio, String, default: 'WS'

      # Rio de janeiro
      attribute :numero, Integer, default: 1
      attribute :inscricao_municipal, String

      def initialize(attributes = nil)
        attributes = JSON.parse(attributes) if attributes.is_a?(String)
        super(attributes)
      end

      def qtd_rps
        rps.size
      end

      def valor_servicos
        rps.reduce(0) do |total,obj|
          total += obj.valor_servico
        end
      end

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
