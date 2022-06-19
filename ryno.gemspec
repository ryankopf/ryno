require_relative "lib/ryno/version"

Gem::Specification.new do |spec|
  spec.name        = "ryno"
  spec.version     = Ryno::VERSION
  spec.authors     = ["Ryan Kopf"]
  spec.email       = ["ryno@ryankopf.com"]
  spec.homepage    = "https://ryankopf.com"
  spec.summary     = "A Rails CMS."
  spec.description = "Make making pages easier."
  spec.license     = "Free To Use"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ryankopf/ryno"
  spec.metadata["changelog_uri"] = "https://github.com/ryankopf/ryno/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "THE-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.1.0"
  #Future: spec.add_dependency "image_processing", "~> 1.0"
end
