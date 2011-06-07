# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sechat}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Julien Portalier"]
  s.date = %q{2011-06-06}
  s.description = %q{Q&A engine for Ruby on Rails.}
  s.email = %q{ysbaddaden@gmail.com}
  s.files = [
    "lib/sechat.rb",
    "lib/sechat/controllers/answers_controller.rb",
    "lib/sechat/controllers/questions_controller.rb",
    "lib/sechat/models/answer.rb",
    "lib/sechat/models/question.rb",
    "lib/sechat/routes.rb"
  ]
  s.homepage = %q{http://github.com/ysbaddaden/sechat}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Blog engine for Ruby on Rails.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.7"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.7"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.7"])
  end
end

