module Nfse
  module Cancelamento
    class Nota < Nfse::Base
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
