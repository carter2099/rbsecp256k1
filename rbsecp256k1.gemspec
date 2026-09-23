# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path('lib', __dir__))
require 'rbsecp256k1/version'

Gem::Specification.new do |s|
  s.name    = 'rbsecp256k1'
  s.version = Secp256k1::VERSION
  s.summary =
    'Native extension gem for secp256k1 ECDSA and Schnorr signatures. ' \
    'Wraps libsecp256k1 natively without any need for FFI.'
  s.license = 'MIT'
  s.authors = ['Eric Scrivner']
  s.homepage = 'https://github.com/etscrivner/rbsecp256k1'

  s.files = (
    Dir['lib/**/**.rb'] +
    Dir['documentation/**.md'] +
    %w[ext/rbsecp256k1/rbsecp256k1.c ext/rbsecp256k1/extconf.rb Rakefile README.md]
  )
  s.require_paths = %w[ext lib]

  s.extensions = ['ext/rbsecp256k1/extconf.rb']

  # Dependencies required to build and run this gem
  s.add_dependency 'mini_portile2', '~> 2.8'
  s.add_dependency 'pkg-config', '~> 1.5'
  # Build-time only (extconf.rb extracts the pinned libsecp256k1 archive).
  # >= 3.4 carries the fix for CVE-2026-85396 / GHSA-47m2-wp7j-p9vc.
  s.add_dependency 'rubyzip', '>= 3.4', '< 4'

  # Development dependencies
  s.add_development_dependency 'base64' # RuboCop 0.78 on Ruby >= 3.4
  s.add_development_dependency 'benchmark' # RuboCop 0.78 on Ruby >= 4.0
  s.add_development_dependency 'keccak', '~> 1.3'
  s.add_development_dependency 'ostruct' # RuboCop 0.78 on Ruby >= 4.0
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rake-compiler', '~> 1.2'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'rubocop', '0.78'
  s.add_development_dependency 'ruby_memcheck', '~> 1.2'
  s.add_development_dependency 'yard', '~> 0.9'
end
