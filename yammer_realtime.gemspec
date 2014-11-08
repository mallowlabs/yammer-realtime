# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yammer_realtime/version'

Gem::Specification.new do |spec|
  spec.name        = 'yammer_realtime'
  spec.version     = YammerRealtime::VERSION

  spec.authors     = ['mallowlabs']
  spec.email       = ['mallowlabs@gmail.com']
  spec.description = 'YammerRealtime is a ruby client for Yammer Realtime API.'
  spec.summary     = spec.description
  spec.homepage    = 'https://github.com/mallowlabs/yammer_realtime'
  spec.licenses    = ['MIT']

  spec.add_development_dependency 'bundler', '~> 1.0'

  spec.files = %w(README.md yammer_realtime.gemspec) + Dir['lib/**/*.rb']

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.3'
end
