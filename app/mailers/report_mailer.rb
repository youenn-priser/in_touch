class ReportMailer < ApplicationMailer

  def report
    @project = params[:project]
    @content = params[:content]
    mail(
      to: @project.client.email,
      subject: "#{@project.title} - Project Report"
      )
  end
end
