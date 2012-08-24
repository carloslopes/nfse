require 'nfse/version'

module Nfse
  autoload :Lote, 'nfse/lote'
  autoload :Rps, 'nfse/rps'
  autoload :Deducao, 'nfse/deducao'
  autoload :Item, 'nfse/item'
  autoload :Prestador, 'nfse/prestador'
  autoload :Tomador, 'nfse/tomador'

  class Base
    def initialize(attributes = {})
      if attributes.is_a? Hash
        attributes.each do |k,v|
          send("#{k}=", v)
        end
      end
    end
  end
end
