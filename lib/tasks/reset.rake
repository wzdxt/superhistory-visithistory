desc 'reset visit process'
task :reset  => :environment do
  p VisitHistory.reset
  p VisitProcess.reset
end