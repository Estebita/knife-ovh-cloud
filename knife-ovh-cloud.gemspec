# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "knife-ovh-cloud"
  s.version = "1.0.0.pre.1"
  s.summary = "OVH Cloud infrastructure Support for Knife"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.authors = "Ezra Pagel"
  s.description = "OVH Cloud vSphere Support for Chef's Knife Command"
  s.email = "alexis@kroknet.com"
  s.files = Dir["lib/**/*"]
  s.rubygems_version = "1.6.2"
  s.homepage = 'http://github.com/Estebita/knife-ovh-cloud'
  s.license = 'Apache'
  s.add_dependency('netaddr', ["~> 1.5.0"])
  s.add_dependency('chef', [">= 0.10.0"])
  s.add_dependency('rbvmomi', ["~> 1.5.1"])
end
