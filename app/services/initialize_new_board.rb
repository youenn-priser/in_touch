class CreateBoard < ApplicationService

  def initialize(user, board_name)
    @user = user
    @board_name = board_name
  end

  def create_board(user, board_name)
    params = {
      name: board_name,
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
      token: user.token
    }

    response = RestClient.post "https://api.trello.com/1/boards", params
    JSON.parse(response.body)["id"]
  end

  def create_lists(board_id, list_name = "")
    list_names = ["Done", "To deploy", "Waiting for client", "To review/debug", "In Progress", "To Do", "Sprint2", "Sprint1"]

    list_names.each do |list_name|
      params = {
        name: list_name,
        pos: top,
        key: ENV['TRELLO_API_KEY'],
        token: user.token
      }

      response = RestClient.post "https://api.trello.com/1/boards/#{board_id}/lists", params
      # puts response.body
    end
  end

  def create_labels(board_id)
    label_names = {"Sprint2": "yellow", "Sprint1": "green"}

    label_names.each do |label_name, label_color|
      params = {
        name: label_name,
        color: label_color,
        key: ENV['TRELLO_API_KEY'],
        token: user.token
      }

      response = RestClient.post "https://api.trello.com/1/boards/#{board_id}/labels", params
      # puts response.read_body
    end
  end

  def call
    # board_id = create_board("@board_name")
    board_id = create_board("my_new_board")
    create_labels(board_id)
    create_lists(board_id)
  end
end
