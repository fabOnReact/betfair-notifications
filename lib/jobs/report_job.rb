# class ReportJob
#   # include SuckerPunch::Job
#   include SuckerPunch::Backgroundable
#   attr_reader :report
#   # workers 12 # increase this numbers if you want to start more processes
# 
#   always_background :perform
#   def perform(model)
#     @report = Report.new(model)
#     @report.display = false
#     puts 'perform sleeps 10 seconds'
#     sleep 10
#     puts 'perform woke up'
#     until report.notify?; end
#     @report.display = true
#   end
#   
#   def output report
#     puts 'output called'
#     report.books_report
#   end
# 
#   def message
#     puts "fuck you"
#   end
# 
#   def ready? 
#     @display
#   end
# end
