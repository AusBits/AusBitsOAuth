# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-peatio/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "peatio"
  gem.email         = "support@peatio.com"
  gem.description   = %q{OmniAuth Oauth2 strategy for peatio.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for peatio.}
  gem.homepage      = "https://github.com/peatio/omniauth-peatio"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-peatio"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Peatio::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_dependency 'peatio_client'
end
