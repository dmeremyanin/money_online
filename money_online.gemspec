# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "money_online/version"

Gem::Specification.new do |s|
  s.name        = "money_online"
  s.version     = MoneyOnline::VERSION
  s.authors     = ["Dimko"]
  s.email       = ["deemox@gmail.com"]
  s.homepage    = "http://github.com/dimko/money_online"
  s.summary     = %q{Simple wrapper for a DengiOnline service}
  s.description = %q{MoneyOnline (aka DengiOnline) is a payment system, that have a single interface for many payment providers}

  s.rubyforge_project = "money_online"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "active_support", "~> 3.0"
end
