class ReportMailer < ApplicationMailer

  def alert
    @project = Project.find(params[:project])
    mail(
      to: @project.user.email,
      subject: "Project : #{@project.title} - Your weekly recap is ready'"
      )
  end


  def report
    @project = Project.find(params[:project])
    @subject = params[:subject]
    @content = params[:content]
    @destiny = @project.reports.last.client_email
    mail(
      to: @destiny,
      subject: "#{@subject}"
      )
  end
end
