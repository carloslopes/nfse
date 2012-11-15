module Nfse
  class Base < Mustache
    PREFEITURA = :campinas
    def self.inherited(subclass)
      subclass.template_path = File.expand_path("../../templates/#{Nfse::Base::PREFEITURA}/", __FILE__)      
    end
  end
end