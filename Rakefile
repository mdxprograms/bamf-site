require 'rubocop'
require 'susy'

desc 'serve'
task :s do
  system('bundle exec jekyll liveserve -w')
end

desc 'build'
task :b do
  system('bundle exec jekyll b --verbose')
end

desc 'cop'
task :cop do
  system('bundle exec rubocop --config .rubocop_todo.yml --auto-correct')
end
