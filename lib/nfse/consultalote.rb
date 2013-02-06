require 'json'

module Nfse
  class ConsultaLote < Nfse::Base
    include Virtus

    attribute :cod_cidade, String
    attribute :cnpj, String
    attribute :num_lote, String
    attribute :versao, Integer, default: 1

    def initialize(attributes = nil)
      attributes = JSON.parse(attributes) if attributes.is_a?(String)
      super(attributes)
    end
  end
end
