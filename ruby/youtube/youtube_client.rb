require "net/http"
require "uri"
require 'json'

class YoutubeClient

  attr_reader :number_of_search_results, :links_to_search_results

  def initialize(number_of_search_results = nil)
    @base_url = "https://www.googleapis.com/youtube/v3"
    @client_api_key = "AIzaSyBBLOaiVxjYZtodv-3uzFrOauZOP3F6WGc"

    @number_of_search_results = number_of_search_results || 3
    @links_to_search_results = []
  end

  def execute_search(search_term)
    uri = URI.parse create_search_request(search_term)

    response = Net::HTTP.get_response(uri)
    parse_search_results(response.body)
  end

  def create_search_request(search_term)
    "#{@base_url}/search?part=snippet&q=#{search_term}&maxResults=#{@number_of_search_results}&type=video&key=#{@client_api_key}"
  end

  def parse_search_results(response_body)
    video_items = JSON.parse(response_body, symbolize_names: true)[:items]
    video_ids = video_items.map { |video| video[:id][:videoId] }

    video_ids.each do |id|
      @links_to_search_results << "https://www.youtube.com/watch?v=#{id}"
    end
  end

  def display_results
    @links_to_search_results.map { |link| link }
  end

end

