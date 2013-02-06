module Nfse
  module Cancelamento
    class Lote < Nfse::Base
      include Virtus

      attribute :id, String, default: lambda { |lote,_| "#{lote.object_id}#{Time.now.to_i}" }
      attribute :cod_cidade, String
      attribute :cnpj, String
      attribute :transacao, String, default: 'true'
      attribute :versao, Integer, default: 1

      attribute :notas, Array[Nota]

      def initialize(attributes = nil)
        attributes = JSON.parse(attributes) if attributes.is_a?(String)
        super(attributes)
      end

      def render_notas
        notas.reduce('') do |xml,nota|
          xml << nota.render
        end
      end
    end
  end
end
