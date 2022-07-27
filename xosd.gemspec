Gem::Specification.new do |spec|
  spec.name        = 'xosd'
  spec.version     = '1.1.0'
  spec.date        = '2022-07-27'
  spec.summary     = "Ruby wrapper for xosd"
  spec.description = "Ruby wrapper for xosd - X on screen display library"
  spec.authors     = ["Yurie Nagorny"]
  spec.email       = 'ynagorny@bearincorp.com'
  spec.homepage    = 'https://github.com/ynagorny/xosd'
  spec.license     = 'MIT'

  git_tracked_files = `git ls-files -z`.split("\x0")
  gem_ignored_files = `git ls-files -i -X .gemignore -z`.split("\x0")
  spec.files = git_tracked_files - gem_ignored_files

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ffi', '~> 1.15.5'

  spec.add_development_dependency 'rspec'
end
