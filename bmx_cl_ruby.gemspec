
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bmx_cl_ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "bmx_cl_ruby"
  spec.version       = BmxClRuby::VERSION
  spec.authors       = ["andyl"]
  spec.email         = ["andy@r210.com"]

  spec.summary       = "Bugmark Command-line interface."
  spec.description   = "Bugmark Command-line interface for scripting."
  spec.homepage      = "http://github.com/bugmark/bmx_cl_ruby"
  spec.license       = "Nonstandard"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this
  # section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency  "rake"           ,  "~> 12.3"
  spec.add_development_dependency  "rspec"          ,  "~> 3.8"
  spec.add_dependency              "thor"           ,  "~> 0.20"
  spec.add_dependency              "pry"            ,  "~> 0.12"
  spec.add_dependency              "awesome_print"  ,  "~> 1.8"
  spec.add_dependency              "graphql-client" ,  "~> 0.14"
end
