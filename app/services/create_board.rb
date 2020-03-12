class CreateBoard

  def initialize(project)
    @project = project
    @user    = project.user
  end

  def call
    response = create_board
    @board_id = response[:id]
    @board_url = response[:url]

    @project.update(trello_board_id: @board_id)
    @project.update(trello_board_url: @board_url)

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
    id  = JSON.parse(response.body)["id"]
    url = JSON.parse(response.body)["url"]
    return {id: id, url: url}
  end

  def create_lists
    list_names = ["Done", "To deploy", "Waiting for client", "To review/debug", "In Progress", "To Do"]

    list_names.each do |list_name|
      create_list(list_name)
    end

    sprint_names.each do |sprint_name|
      list_id = create_list(sprint_name)

      @project.sprints.create!(
        title:          sprint_name,
        trello_list_id: list_id
      )
    end
  end

  def create_list(list_name)
    params = {
      name: list_name,
      pos: 'top',
      key: ENV['TRELLO_API_KEY'],
      token: @user.token
    }

    response = RestClient.post "https://api.trello.com/1/boards/#{@board_id}/lists", params

    return JSON.parse(response.body)["id"]
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

      RestClient.post "https://api.trello.com/1/boards/#{@board_id}/labels", params
    end
  end

  def create_webhook
    callback_url = "http://#{ENV['DOMAIN']}/trello_webhooks"

    params = {
      idModel: @board_id,
      callbackURL: callback_url,
      description: "InTouch board webhook",
      active: true,
      key: ENV['TRELLO_API_KEY'],
      token: @user.token
    }

    RestClient.post "https://api.trello.com/1/webhooks/", params
    # base_url = "https://api.trello.com/1/webhooks/"
    # query_string = Rack::Utils.build_query(params)

    # webhook_creation_url = "#{base_url}?#{query_string}"

    # begin
    #   binding.pry
    #   RestClient.post(webhook_creation_url, {}, {})
    # rescue RestClient::BadRequest => e
    #   binding.pry
    # end


    # from 'trello' gem
    # webhook = Trello::Webhook.new

    # webhook.description  = "InTouch board webhook"
    # webhook.id_model     = @board_id
    # webhook.callback_url = webhook_url
    # webhook.active       = true
    # webhook.save
  end

  def sprint_names
    names = []

    @project.number_of_sprints.times do |index|
      names << "Sprint #{index + 1}"
    end

    return names
  end
end
