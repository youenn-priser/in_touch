class NotificationsSchedulerJob < ApplicationJob
  queue_as :mailers

  def perform
    @projects = Project.all
    # Do something later
    @projects.each do |project|
      ReportsNotificationJob.perform_later(project.id)
    end
  end
end
