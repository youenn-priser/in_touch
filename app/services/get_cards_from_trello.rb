require 'rest-client'
require 'json'

class GetCardsFromTrello #< ApplicationService

  def initialize(board_id)
    @board_id = board_id
  end

  def self.call
    params = {
        cards: 'all',
        card_fields: 'all', #id,name,dateLastActivity,desc,idLabels,labels
        filter: 'open',
        fields: 'all',
        # key: ENV['TRELLO_API_KEY'],
        key: '170be5e01f018dae9aba1a228c8a23b2',
        # token: user.token
        token: '83d92ded92b18476188d164979237e52b42db24c912d6d2b12be67f3098c4f68'
      }
    board_id = '5e5d2468afb9ce59727e2540'
    response = RestClient.get "https://api.trello.com/1/boards/#{board_id}/lists", params: params
    p response

    # board_lists = JSON.parse(response.body).map {|list| list["name"]}
    board_lists = JSON.parse(response.body)[0]['cards']
    board_lists.each { |card| p card['name']}
  end
end

GetCardsFromTrello.call
