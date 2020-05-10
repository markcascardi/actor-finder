require_relative 'lib/actor_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "actor_finder"
  spec.version       = ActorFinder::VERSION
  spec.authors       = ["markcascardi"]
  spec.email         = ["mcascardi@gmail.com"]

  spec.summary       = %q{"List actors, roles, and filming locations"}
  spec.description   = %q{"List actors, roles, and filming locations"}
  spec.homepage      = "https://github.com/markcascardi/actor-finder"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/markcascardi/actor-finder"
  spec.metadata["changelog_uri"] = "https://github.com/markcascardi/actor-finder/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", ">= 10", "< 14"
  spec.add_dependency "nokogiri", "~> 1.10", ">= 1.10.9"
  spec.add_dependency "colorize"
  
  spec.add_development_dependency "pry", "~> 0.13.1"

end
