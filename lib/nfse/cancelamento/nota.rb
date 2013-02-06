module Nfse
  module Cancelamento
    class Nota < Nfse::Base
      include Virtus

      attribute :numero, Integer
      attribute :inscricao_municipal, String
      attribute :cod_verificacao, String
      attribute :motivo_cancelamento, String

      def formatted_inscricao_municipal
        inscricao_municipal.to_s.rjust(9, '0')
      end
    end
  end
end
