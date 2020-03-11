class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @clients = Client.all
    # @clients = Client.all.map { |client| ["#{client.first_name} #{client.last_name}", client]}
    @project = Project.new
    # @project.client.build
    @plop = false
  end

  def create
    @project = Project.new(
      title:             params[:project_title],
      number_of_sprints: params[:number_of_sprints]
    )

    # define client, and assign it to project
    if params[:project_client] == "" # if select client is empty, then create a client
      @client = Client.new(
        first_name:   params[:client_first_name],
        last_name:    params[:client_last_name],
        email:        params[:client_email],
        company:      params[:client_company],
        phone:        params[:client_phone_number]
      )

      unless @client.save
        @clients = Client.all
        @plop = true
        return render :new
      end

      @project.client_id = @client.id
    else  # assign client from sel
      @project.client_id = params[:project_client]
    end

    #assign user to project
    @project.user = current_user

    if @project.save
      #create trello dashboard
      # @board = CreateBoardService.new(current_user, params[:project_title])
      @board = CreateBoardService.new(@project)
      @board_id = @board.call

      # assign trello board id to project
      @project.trello_board_id = @board_id

      redirect_to project_path(@project)
    else
      render :new
    end

end
