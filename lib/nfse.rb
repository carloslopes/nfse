require 'nfse/version'
require 'mustache'

module Nfse
  # Envio
  Envio = Module.new
  Envio.autoload(:Lote, 'nfse/envio/lote')
  Envio.autoload(:Rps, 'nfse/envio/rps')
  Envio.autoload(:Deducao, 'nfse/envio/deducao')
  Envio.autoload(:Item, 'nfse/envio/item')
  Envio.autoload(:Prestador, 'nfse/envio/prestador')
  Envio.autoload(:Tomador, 'nfse/envio/tomador')
end
