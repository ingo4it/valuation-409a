$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'valuation-409a/version'

spec = Gem::Specification.new do |s|
  s.name = 'valuation-409a'
  s.version = Valuation409a::VERSION
  s.summary = 'Ruby bindings for the 409A API'
  s.description = '409a is the easiest way to Save Time and money while finding the best solution'
  s.authors = ['Jeron Paul', 'Ingo Klein']
  s.email = ['jeron@409.com', 'ingo@409a.com']
  s.homepage = 'http://409a.com/'
  s.license = 'Capshare'

  s.add_dependency('rest-client', '~> 1.4')
  s.add_dependency('mime-types', '>= 1.25', '< 3.0')
  s.add_dependency('json', '~> 1.8.1')

  s.add_development_dependency('mocha', '~> 0.13.2')
  s.add_development_dependency('shoulda', '~> 3.4.0')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('rake')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end