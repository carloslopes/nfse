require 'minitest/autorun'
require 'minitest/pride'
require 'mocha'
require 'nokogiri'
require File.expand_path('../../lib/nfse.rb', __FILE__)

module NfseXmlComparator
  # Retorna o xml do xpath passado como argumento
  # options[:str] => opção de receber uma string onde será procurado o xpath em seu conteúdo
  # options[:file] => nome do arquivo do qual o conteúdo será lido e usado para procurar o xpath
  def xml(path, options = {})
    options[:str] ||= File.read(File.expand_path("../fixtures/#{options[:file]}.xml", __FILE__))
    doc = Nokogiri::XML(options[:str]) do |config|
      config.noblanks
    end

    doc.xpath(".//#{path}").to_xml
  end
end

class MiniTest::Spec
  include NfseXmlComparator
end
