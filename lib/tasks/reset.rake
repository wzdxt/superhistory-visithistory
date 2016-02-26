desc 'reset visit process'
task :reset  => :environment do
  p VisitProcess.reset
end