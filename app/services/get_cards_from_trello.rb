require 'open-uri'
require 'net/http'
require 'openssl'
require 'json'




def get_lists_and_cards(board_id)
  url = URI("https://api.trello.com/1/boards/#{board_id}/lists?cards=all&card_fields=all&filter=open&fields=all&key=#{TRELLO_API_KEY}&token=#{TRELLO_TOKEN}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)

  response = http.request(request)
  # board_lists = JSON.parse(response.read_body).map {|list| list["name"]}
  board_lists = JSON.parse(response.read_body)
end
