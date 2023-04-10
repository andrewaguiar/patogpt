Gem::Specification.new do |spec|
  spec.name          = "pato-gpt"
  spec.version       = "0.1.0"
  spec.authors       = ["Andrew S Aguiar"]
  spec.email         = ["andrewaguiar6@gmail.com"]

  spec.summary       = 'Pato assistente' 
  spec.description   = 'Pato assistente que usa ChatGpt'
  spec.homepage      = "https://github.com/andrewaguiar/patogpt"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'pastel'
  spec.add_dependency 'tty-spinner'
  spec.add_dependency 'tty-markdown'
end
