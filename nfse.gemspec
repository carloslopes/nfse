# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nfse/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Carlos Eduardo L. Lopes\n", "Rafael Lima"]
  gem.email         = ["carlos.el.lopes@gmail.com", "contato@rafael.adm.br"]
  gem.description   = %q{Gem para realizar diversas ações relacionadas a nota fiscal de serviço eletrônica}
  gem.summary       = %q{Gem para realizar diversas ações relacionadas a nota fiscal de serviço eletrônica}
  gem.homepage      = "https://github.com/carloslopes/nfse"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/*}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/*})
  gem.name          = "nfse"
  gem.require_paths = ["lib"]
  gem.version       = Nfse::VERSION

  gem.add_dependency 'mustache', '~> 0.99'

  gem.add_development_dependency 'rake', '~> 0.9.2'
  gem.add_development_dependency 'nokogiri', '~> 1.5'
  gem.add_development_dependency 'mocha', '~> 0.12.7'
  gem.add_development_dependency 'minitest-debugger', '~> 1.0.0'

end
