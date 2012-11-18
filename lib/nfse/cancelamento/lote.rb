module Nfse
  module Cancelamento
    class Lote < Nfse::Base
      attr_accessor :cod_cidade, :cnpj
      attr_writer :id, :transacao, :versao
      attr_reader :notas

      def initialize(json = nil)
        @notas = []

        if json
          attributes = JSON.parse(json)

          notas = attributes.delete('notas')
          notas.each { |data| self.notas << Nota.new(data) } if notas

          attributes.each do |k,v|
            send("#{k}=", v)
          end
        end
      end

      def id
        @id ||= "#{self.object_id}#{Time.now.to_i}"
      end

      def transacao
        @transacao ||= 'true'
      end

      def versao
        @versao ||= '1'
      end

      def render_notas
        notas.reduce('') do |xml,nota|
          xml << nota.render
        end
      end
    end
  end
end
