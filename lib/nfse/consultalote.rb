require 'json'

module Nfse
  class ConsultaLote < Nfse::Base
    attr_accessor :cod_cidade, :cnpj, :num_lote
    attr_writer :versao

    def initialize(attributes = {})
      attributes = JSON.parse(attributes) if attributes.is_a?(String)

      attributes.each do |k,v|
        send("#{k}=", v)
      end
    end

    def versao
      @versao ||= '1'
    end
  end
end
