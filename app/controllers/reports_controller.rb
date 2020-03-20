class ReportsController < ApplicationController
  def index
    # Lists every reports that have been sent to the client
    @project = Project.find(project_params[:project_id])
    @reports = @project.reports.order(created_at: :desc)
  end

  def new
    # Instanciate a new report to be modified and then created in the DB
    @project   = Project.find(project_params[:project_id])
    @report    = Report.new

    #comment those lines if you have previous record in previous formatting ---------------------------
    if !@project.reports.empty?
      previous_db_record = JSON.parse(Report.where(project: @project).last.actual_db_record, symbolize_names: true)
      current_db_record = JSON.parse(RecordModule::DbToJsonService.new(@project).call, symbolize_names: true)
      @db_record_changes = RecordModule::RecordCompareService.new(previous_db_record, current_db_record).call
    end
    # until here --------------------------------------------------------------------------------------
    @mail_template = RecordModule::MailTemplateService.new(@project).call
  end

  def create
    # Creates a new report in the DB, to be sent to the client

    @project                 = Project.find(project_params[:project_id])
    @report                  = Report.new(client_email: report_params[:report_client_email], description: report_params[:report_description], report_topic: report_params[:report_topic])
    @report.project_id       = project_params[:project_id]
    @report.actual_db_record = RecordModule::DbToJsonService.new(@project).call

    if @report.save
      mail = ReportMailer.with(project: @project.id, subject: @report.report_topic ,content: @report.description).report
      mail.deliver_now
      flash[:success] = "Oh yeah ! You successfully sent a recap to your client."
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def project_params
    params.permit("project_id")
  end

  def report_params
    params.require(:report).permit("report_client_email", "report_description", "report_topic")
  end

end
