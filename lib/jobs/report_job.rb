class ReportJob
  include SuckerPunch::Job

  def perform(model)
    Report.new(model).monitor
  end
end
