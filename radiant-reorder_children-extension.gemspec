# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-reorder_children-extension/version"

Gem::Specification.new do |s|
  s.name        = "radiant-reorder_children-extension"
  s.version     = RadiantReorderChildrenExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Benny Degezelle"]
  s.email       = ["benny@gorilla-webdesign.be"]
  s.homepage    = "http://github.com/jomz/radiant-reorder_children-extension"
  s.summary     = %q{Reorder Children for Radiant CMS}
  s.description = %q{Makes Radiant better by adding reorder_children!}
  
  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
  
end