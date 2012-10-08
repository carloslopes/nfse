# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nfse/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Carlos Eduardo L. Lopes\n"]
  gem.email         = ["carlos.el.lopes@gmail.com"]
  gem.description   = %q{Gem para realizar diversas ações relacionadas a nota fiscal de serviço eletrônica}
  gem.summary       = %q{Gem para realizar diversas ações relacionadas a nota fiscal de serviço eletrônica}
  gem.homepage      = "https://github.com/carloslopes/nfse"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/*}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/*})
  gem.name          = "nfse"
  gem.require_paths = ["lib"]
  gem.version       = Nfse::VERSION
end
