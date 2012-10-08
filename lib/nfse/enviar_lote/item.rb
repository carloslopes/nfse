module Nfse
  module EnviarLote
    class Item < Base
      attr_accessor :discriminacao, :tributavel

      def quantidade
        @quantidade ||= 0.0
      end

      # Atribui um valor para a quantidade
      # rescue NoMethodError para quando for passado um object que não responde a #to_f
      def quantidade=(value)
        @quantidade = value.to_f
      rescue NoMethodError
      end

      def valor_unitario
        @valor_unitario ||= 0.0
      end

      # Atribui um valor para o valor_unitario
      # rescue NoMethodError para quando for passado um object que não responde a #to_f
      def valor_unitario=(value)
        @valor_unitario = value.to_f
      rescue NoMethodError
      end

      def valor_total
        quantidade * valor_unitario
      end
    end
  end
end
