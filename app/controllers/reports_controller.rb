class ReportsController < ApplicationController
  def index
    # Lists every reports that have been sent to the client
  end

  def new
    # Instanciate a new report to be modified and then created in the DB
    @project = Project.find(params[:project_id])
    @report = Report.new
  end

  def create
    # Creates a new report in the DB, to be sent to the client
  end

end
