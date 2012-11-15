module Nfse
  module Envio
    class Deducao < Nfse::Base
      attr_accessor :por, :tipo, :cnpj_ref, :num_nf_ref, :valor_total_ref, :percentual

      def initialize(attributes = {})
        attributes.each do |k,v|
          send("#{k}=", v)
        end
      end

      def valor
        @valor ||= 0.0
      end

      # Atribui um valor para o valor
      # rescue NoMethodError para quando for passado um object que não responde a #to_f
      def valor=(value)
        @valor = value.to_f
      rescue NoMethodError
      end
    end
  end
end
