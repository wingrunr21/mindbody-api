require 'rubygems'
require 'bundler'
Bundler::GemHelper.install_tasks
require 'rspec/core/rake_task'
require 'dotenv/tasks'

# Rake tasks from https://github.com/mojombo/rakegem/blob/master/Rakefile

# Helper Functions
def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

def version
  line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
  line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

# Standard tasks
RSpec::Core::RakeTask.new(:spec)
task :test => :spec
task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Open an irb session preloaded with this library"
task :console => :dotenv do
  sh "pry -Ilib -r #{name}.rb"
end

namespace :wsdl do
  desc "Update the cached MindBody API wsdls"
  task :update do
    require 'open-uri'

    url = "https://api.mindbodyonline.com/0_5/%sService.asmx?wsdl"
    services = %w{Appointment Class Client Finder Sale Site Staff}

    services.each do |service|
      wsdl = open(url % service).read
      File.open("wsdl/#{service}Service.wsdl", 'w') do |f|
        f.write wsdl
      end
    end
  end
end
