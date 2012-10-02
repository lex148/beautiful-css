# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beautiful-css/version'

Gem::Specification.new do |gem|
  gem.name          = "beautiful-css"
  gem.version       = BeautifulCss::VERSION
  gem.authors       = ["Lex Childs"]
  gem.email         = ["lexchilds@gmail.com"]
  gem.description   = %q{A tool to help cleanup css}
  gem.summary       = %q{reworks your css to make it simple and mantainable}
  gem.homepage      = "http://beautifulcss.org"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
