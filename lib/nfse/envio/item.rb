module Nfse
  module Envio
    class Item < Nfse::Base
      include Virtus

      attribute :discriminacao, String
      attribute :quantidade, Float, default: 0
      attribute :valor_unitario, Float, default: 0
      attribute :tributavel, String

      def valor_total
        @quantidade * @valor_unitario
      end
    end
  end
end
