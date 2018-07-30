# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-ausbits/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "ausbits"
  gem.email         = "support@ausbits.com.au"
  gem.description   = %q{OmniAuth Oauth2 strategy for ausbits.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for ausbits.}
  gem.homepage      = "https://github.com/ausbits/AusBitsOAuth"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-ausbits"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Ausbits::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_dependency 'ausbits_client'
end
