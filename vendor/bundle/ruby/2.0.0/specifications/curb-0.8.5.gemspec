# -*- encoding: utf-8 -*-
# stub: curb 0.8.5 ruby lib ext
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "curb"
  s.version = "0.8.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib", "ext"]
  s.authors = ["Ross Bamford", "Todd A. Fisher"]
  s.date = "2013-06-05"
  s.description = "Curb (probably CUrl-RuBy or something) provides Ruby-language bindings for the libcurl(3), a fully-featured client-side URL transfer library. cURL and libcurl live at http://curl.haxx.se/"
  s.email = "todd.fisher@gmail.com"
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["LICENSE", "README"]
  s.files = ["LICENSE", "README", "ext/extconf.rb"]
  s.homepage = "http://curb.rubyforge.org/"
  s.rdoc_options = ["--main", "README"]
  s.rubyforge_project = "curb"
  s.rubygems_version = "2.4.8"
  s.summary = "Ruby libcurl bindings"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version
end
