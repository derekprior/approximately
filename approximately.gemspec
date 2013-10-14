# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'approximately/version'

Gem::Specification.new do |spec|
  spec.name          = 'Approximately'
  spec.version       = Approximately::VERSION
  spec.authors       = ['Derek Prior']
  spec.email         = ['derekprior@gmail.com']
  spec.description   = <<-DESC
    Count queries without a where clause cause PostgreSQL to do a full table
    scan to count the exact number of rows. Approximately uses metadata stored
    by PostgreSQL to return an approximate count of the rows without the full
    table scan.
  DESC
  spec.summary       = 'Fast, approximate table row counts with Postgres'
  spec.homepage      = 'https://github.com/derekprior/approximately'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'pry'
end
