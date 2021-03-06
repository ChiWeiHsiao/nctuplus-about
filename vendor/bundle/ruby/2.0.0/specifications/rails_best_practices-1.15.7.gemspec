# -*- encoding: utf-8 -*-
# stub: rails_best_practices 1.15.7 ruby lib assets

Gem::Specification.new do |s|
  s.name = "rails_best_practices"
  s.version = "1.15.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib", "assets"]
  s.authors = ["Richard Huang"]
  s.date = "2015-02-27"
  s.description = "a code metric tool for rails codes, written in Ruby."
  s.email = ["flyerhzm@gmail.com"]
  s.executables = ["rails_best_practices"]
  s.files = ["bin/rails_best_practices"]
  s.homepage = "http://rails-bestpractices.com"
  s.licenses = ["MIT"]
  s.post_install_message = "********************************************************************************\n\n  rails_best_practices is a code metric tool to check the quality of rails codes.\n\n  I highly recommend you browse the Rails Best Practices website first.\n\n      http://rails-bestpractices.com\n\n  Please also try our online service\n\n      http://railsbp.com\n\n  Enjoy!\n\n      Richard Huang (flyerhzm@gmail.com)\n\n********************************************************************************\n"
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0")
  s.rubygems_version = "2.4.8"
  s.summary = "a code metric tool for rails codes."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<code_analyzer>, [">= 0.4.3"])
      s.add_runtime_dependency(%q<colored>, [">= 0"])
      s.add_runtime_dependency(%q<erubis>, [">= 0"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_runtime_dependency(%q<require_all>, [">= 0"])
      s.add_runtime_dependency(%q<ruby-progressbar>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<haml>, [">= 0"])
      s.add_development_dependency(%q<slim>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<awesome_print>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<code_analyzer>, [">= 0.4.3"])
      s.add_dependency(%q<colored>, [">= 0"])
      s.add_dependency(%q<erubis>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<require_all>, [">= 0"])
      s.add_dependency(%q<ruby-progressbar>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<slim>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<code_analyzer>, [">= 0.4.3"])
    s.add_dependency(%q<colored>, [">= 0"])
    s.add_dependency(%q<erubis>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<require_all>, [">= 0"])
    s.add_dependency(%q<ruby-progressbar>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<slim>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
  end
end
