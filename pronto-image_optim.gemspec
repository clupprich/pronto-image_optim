lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pronto/image_optim/version'

Gem::Specification.new do |spec|
  spec.name          = 'pronto-image_optim'
  spec.version       = Pronto::ImageOptimVersion::VERSION
  spec.authors       = ['Christoph Lupprich']
  spec.email         = ['christoph@luppri.ch']

  spec.summary       = %q{Pronto runner for ImageOptim}
  spec.homepage      = 'https://github.com/clupprich/pronto-image_optim'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('pronto', '~> 0.9.0')
  spec.add_runtime_dependency('image_optim')
  spec.add_runtime_dependency('image_optim_pack')

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
