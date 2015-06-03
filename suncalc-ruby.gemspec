$:.push File.expand_path("../lib", __FILE__)
require 'suncalc/version'

Gem::Specification.new do |spec|
  spec.name          = "suncalc-ruby"
  spec.version       = SunCalc::VERSION
  spec.authors       = ["mateusmaso"]
  spec.email         = ["m.maso25@gmail.com"]
  spec.description   = %q{Ruby port of SunCalc via ExecJS}
  spec.summary       = %q{Ruby port of SunCalc via ExecJS}
  spec.homepage      = "https://github.com/mateusmaso/suncalc-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'execjs', ">= 1.3"
end
