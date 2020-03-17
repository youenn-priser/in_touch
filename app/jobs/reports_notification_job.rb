class ReportsNotificationJob < ApplicationJob
  queue_as :mailers

  def perform(project_id)
    # Do something later
    mail = ReportMailer.with(project: project_id).alert
    mail.deliver_now
  end
end
