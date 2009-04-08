require 'rubygems'
require 'spec/rake/spectask'

task :specs do
  system("spec spec -c --format nested")
end

task :default => [:specs]

spec = Gem::Specification.new do |s|
  s.name        = "hello"
  s.version     = "0.0.1"
  s.summary     = "Hello is a Ruby interface to a collection of the word 'hello' in many languages and dialects."
  s.email       = "dcroak@thoughtbot.com"
  s.homepage    = "http://github.com/dancroak/hello"
  s.description = "Hello is a Ruby interface to a collection of the word 'hello' in many languages and dialects."
  s.authors     = ["Dan Croak"]
  s.files       = FileList["[A-Z]*", "{lib,data}/**/*"]
end

desc "Generate a gemspec file"
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_yaml
  end
end

