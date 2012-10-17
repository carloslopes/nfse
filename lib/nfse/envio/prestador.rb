module Nfse
  module Envio
    class Prestador
      attr_accessor :inscricao_municipal, :razao_social, :ddd, :telefone

      def initialize(attributes = {})
        if attributes.is_a?(Hash)
          attributes.each do |k,v|
            send("#{k}=", v)
          end
        end
      end
    end
  end
end
