# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'boggle'
  spec.version       = '1.0'
  spec.authors       = ['Tim Holdaway']
  spec.email         = ['t.imothyholdaway+git@yourdomain.com']
  spec.summary       = 'Boggle game solver'
  spec.description   = 'Generates a list of all valid words for a given boggle game board.'
  spec.homepage      = 'http://www.timholdaway.com/'
  spec.license       = 'BSD-2-Clause'

  spec.files         = Dir.glob('{bin,lib}/**/*') + %w[LICENSE.md README.md]
  spec.executables   = ['boggle']
  spec.test_files    = Dir.glob('test/**/*')
  spec.require_paths = ['lib']
end
