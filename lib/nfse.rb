require 'nfse/version'

module Nfse
  # EnviarLote
  EnviarLote = Module.new
  EnviarLote.autoload(:Lote, 'nfse/enviar_lote/lote')
  EnviarLote.autoload(:Rps, 'nfse/enviar_lote/rps')
  EnviarLote.autoload(:Deducao, 'nfse/enviar_lote/deducao')
  EnviarLote.autoload(:Item, 'nfse/enviar_lote/item')
  EnviarLote.autoload(:Prestador, 'nfse/enviar_lote/prestador')
  EnviarLote.autoload(:Tomador, 'nfse/enviar_lote/tomador')

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
