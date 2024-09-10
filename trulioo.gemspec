# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'trulioo'
  s.version     = '0.2.7'
  s.date        = '2017-07-11'
  s.summary     = "A Ruby wrapper for Trulioo's GlobalGateway API"
  s.authors     = ['Dave Nguyen']
  s.email       = 'd@fundamerica.com'
  s.files       = Dir['lib/**/*', 'LICENSE', 'README.md']
  s.homepage    = 'https://github.com/dkleiman/trulioo'
  s.license     = 'MIT'

  s.add_runtime_dependency 'httparty', '~> 0.15'
end
