module Nfse
  module Envio
    class Deducao < Nfse::Base
      include Virtus

      attribute :por, String
      attribute :tipo, String
      attribute :cnpj_ref, String
      attribute :num_nf_ref, Integer
      attribute :valor_total_ref, Float
      attribute :percentual, Float
      attribute :valor, Float, default: 0
    end
  end
end
