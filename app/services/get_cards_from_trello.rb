class GetCardsFromTrello
  def initialize(user, board_id)
    @board_id = board_id
    @user = user
  end

  def call
  # def call
    params = {
        cards: 'all',
        card_fields: 'id,name,dateLastActivity,desc,idLabels,labels',
        filter: 'open',
        fields: 'all',
        key: ENV['TRELLO_API_KEY'],
        token: @user.token
      }
    # @board_id = '5e5d2468afb9ce59727e2540'    Board AirMAskAndShare
    response = RestClient.get "https://api.trello.com/1/boards/#{@board_id}/lists", params: params

    # board_lists = JSON.parse(response.body).map {|list| list["name"]}
    board_lists = JSON.parse(response.body)
    # board_lists = JSON.parse(response.body)[0]['cards']
    # board_lists.map { |card| card['name']}
  end
end

# GetCardsFromTrello.call
