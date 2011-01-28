require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name        = 'hangman'
  s.summary     = 'Solve hangman puzzles'
  s.version     = '0.1.1'
  s.author      = 'Ben Olive'
  s.email       = 'ben.olive@gatech.edu'
  s.homepage    = 'http://github.com/sionide21/Hangman'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.files       = Dir['{bin,lib}/**/**']
  s.executables = 'hangman'
  s.has_rdoc    = true
  s.description = <<-EOF
    Comes up with guesses to hangman puzzles.
  EOF
end

Rake::GemPackageTask.new(spec).define

desc "Remove derived files"
task :clean do
  rm_r 'doc'
  rm_r 'pkg'
end