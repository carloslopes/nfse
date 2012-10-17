require 'minitest/autorun'
require 'minitest/pride'
require 'mocha'
require 'nokogiri'
require File.expand_path('../../lib/nfse.rb', __FILE__)

module NfseXmlComparator
  # Retorna a estrutura xml da tag passada como argumento
  # Se o segundo argumento for passado, a estrutura xml será procurada nessa string
  # Se não for passado o segundo argumento, a estrutura é procurada no arquivo exemplo padrão
  def xml(path, str = nil)
    str ||= File.read(File.expand_path('../fixtures/nfse.xml', __FILE__))
    doc = Nokogiri::XML(str) do |config|
      config.noblanks
    end

    doc.xpath(".//#{path}").to_xml
  end
end

class MiniTest::Spec
  include NfseXmlComparator
end
