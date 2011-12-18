# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "wiskey"
  s.summary = "The solutoiuns for the rails cutupping."

  s.authors                   = [ "Alexey Osipenko" ]
  s.email                     = [ "alexey@osipenko.in.ua" ]
  s.homepage                  = "http://aratak.github.com/wiskey/"
  s.description = "The rails 3 gem, which include SCSS mixins and default rails templates for true-cutupping."
  s.files = `git ls-files`.split("\n")
  s.version = "0.0.4"

  s.add_dependency "rails"         , "~> 3.1.0"

end
