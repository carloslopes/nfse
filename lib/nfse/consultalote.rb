require 'json'

module Nfse
  class ConsultaLote < Mustache
    self.template_file = File.expand_path('../templates/consultalote.mustache', __FILE__)
    attr_accessor :cod_cidade, :cnpj, :num_lote
    attr_writer :versao

    def initialize(json = nil)
      if json
        attributes = JSON.parse(json)
        attributes.each do |k,v|
          send("#{k}=", v)
        end
      end
    end

    def versao
      @versao ||= '1'
    end
  end
end
