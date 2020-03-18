class ReportsNotificationJob < ApplicationJob
  queue_as :mailers

  def perform(project_id)
    # Do something later
    @project = Project.find(project_id)
    mail = ReportMailer.with(project: project_id).alert
    mail.deliver_now
  end
end
