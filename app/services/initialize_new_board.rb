# require 'uri'
require 'open-uri'
require 'net/http'
require 'openssl'
require 'json'

# TRELLO_API_KEY = see .env
# TRELLO_TOKEN   = see .env


def create_board(board_name)
  url = URI("https://api.trello.com/1/boards/?name=#{board_name}&defaultLabels=true&defaultLists=false&keepFromSource=none&powerUps=all&prefs_permissionLevel=private&prefs_voting=disabled&prefs_comments=members&prefs_invitations=members&prefs_selfJoin=true&prefs_cardCovers=true&prefs_background=blue&prefs_cardAging=regular&key=#{TRELLO_API_KEY}&token=#{TRELLO_TOKEN}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Post.new(url)

  response = http.request(request)
  response.read_body
  JSON.parse(response.read_body)["id"]

end

def create_lists(board_id, list_name = "")
  list_names = ["Done", "To deploy", "Waiting for client", "To review/debug", "In Progress", "To Do", "Sprint2", "Sprint1"]

  list_names.each do |list_name|
    url = URI("https://api.trello.com/1/boards/#{board_id}/lists?name=#{list_name}&pos=top&key=#{TRELLO_API_KEY}&token=#{TRELLO_TOKEN}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)

    response = http.request(request)
    # puts response.read_body
  end
end

def create_labels(board_id)
  label_names = {"Sprint2" => "yellow", "Sprint1" => "green"}

  label_names.each do |label_name, label_color|
    p label_name
    p label_color
    url = URI("https://api.trello.com/1/boards/#{board_id}/labels?name=#{label_name}&color=#{label_color}&key=#{TRELLO_API_KEY}&token=#{TRELLO_TOKEN}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)

    response = http.request(request)
    puts response.read_body
  end
end








# p get_lists(BOARD_ID)

board_id = create_board("my_new_board_2")
create_labels(board_id)

create_lists(board_id)

