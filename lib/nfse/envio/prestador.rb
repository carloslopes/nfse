module Nfse
  module Envio
    class Prestador
      include Virtus

      attribute :inscricao_municipal, String
      attribute :razao_social, String
      attribute :ddd, String
      attribute :telefone, String

      # Rio de janeiro
      attribute :cnpj, String
    end
  end
end
