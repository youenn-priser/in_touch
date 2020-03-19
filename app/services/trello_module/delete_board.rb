module TrelloModule
  class DeleteBoard
    def initialize(project)
      @project = project
      @user    = project.user
    end

    def call
      delete
    end

    private

    def delete
      params = {
        id: @project.trello_board_id,
        key: ENV['TRELLO_API_KEY'],
        token: @user.token
      }

      RestClient.delete "https://api.trello.com/1/boards/#{params[:id]}?key=#{params[:key]}&token=#{params[:token]}"
    end
  end
end
