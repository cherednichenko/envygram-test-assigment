require 'cucumber'
require 'cucumber/rake/task'

desc 'Run Cucumber features and generate an HTML summary, JUnit XML and a plain text log'

Cucumber::Rake::Task.new(:features) do |t|
   t.cucumber_opts = [
      "--no-color",
      "--format progress -o logs/features.log",
      "--format junit    -o logs/",
      "--format html     -o logs/features.html",
      "--format pretty"
   ]
end
