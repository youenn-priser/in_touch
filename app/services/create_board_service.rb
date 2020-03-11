class CreateBoardService

  def initialize(project)
    @project = project
    @user    = project.user
  end

  def call
    @board_id = create_board

    create_labels
    create_lists

    return @board_id
  end

  private

  def create_board
    params = {
      name: @project.title,
      defaultLabels: 'true',
      defaultLists: 'false',
      keepFromSource: 'none',
      powerUps: 'all',
      prefs_permissionLevel: 'private',
      prefs_voting: 'disabled',
      prefs_comments: 'members',
      prefs_invitations: 'members',
      prefs_cardCovers: 'true',
      prefs_background: 'blue',
      prefs_cardAging: 'regular',
      key: ENV['TRELLO_API_KEY'],
      token: @user.token
    }

    response = RestClient.post "https://api.trello.com/1/boards", params
    JSON.parse(response.body)["id"]
  end

  def create_lists(list_name = "")
    list_names = ["Done", "To deploy", "Waiting for client", "To review/debug", "In Progress", "To Do"]
    list_names += sprint_names

    list_names.each do |list_name|
      params = {
        name: list_name,
        pos: 'top',
        key: ENV['TRELLO_API_KEY'],
        token: @user.token
      }

      response = RestClient.post "https://api.trello.com/1/boards/#{@board_id}/lists", params
      list_id = JSON.parse(response.body)["id"]

      @project.sprints.create!(
        title: list_name,
        trello_list_id: list_id
      )
    end
  end

  def create_labels
    colors = %w[green yellow orange red purple blue turquoise pink black]

    sprint_names.each_with_index do |label_name, index|
      params = {
        name:  label_name,
        color: colors[index],
        key:   ENV['TRELLO_API_KEY'],
        token: @user.token
      }

      response = RestClient.post "https://api.trello.com/1/boards/#{@board_id}/labels", params
      # puts response.read_body
    end
  end

  def sprint_names
    names = []

    @project.number_of_sprints.times do |index|
      names << "Sprint #{index + 1}"
    end

    return names
  end
end
