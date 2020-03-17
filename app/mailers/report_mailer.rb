class ReportMailer < ApplicationMailer

  def report
    @project = Project.find(params[:project])
    @subject = params[:subject]
    @content = params[:content]
    mail(
      to: @project.client.email,
      subject: "#{@subject}"
      )
  end
end
