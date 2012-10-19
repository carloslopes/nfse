module Nfse
  module Cancelamento
    class Nota < Mustache
      self.template_file = File.expand_path('../templates/nota.mustache', __FILE__)
      attr_accessor :numero, :cod_verificacao, :motivo_cancelamento
      attr_writer :inscricao_municipal

      def initialize(attributes = {})
        attributes.each do |k,v|
          send("#{k}=", v)
        end
      end

      def inscricao_municipal
        @inscricao_municipal.to_s.rjust(9, '0')
      end
    end
  end
end
