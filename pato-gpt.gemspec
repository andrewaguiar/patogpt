# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "pato-gpt"
  spec.version       = "0.1.7"
  spec.authors       = ["Andrew S Aguiar"]
  spec.email         = ["andrewaguiar6@gmail.com"]
  spec.summary       = 'Pato assistente' 
  spec.description   = 'Pato assistente que usa ChatGpt'
  spec.homepage      = 'https://github.com/andrewaguiar/patogpt'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|gem)/}) }
  end

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'pastel', '~> 0.8'
  spec.add_dependency 'tty-markdown', '~> 0.7'
end
