require "pry"
require "net/http"
require "uri"
require "json"

CHALLENGE_URL = "https://www.letsrevolutionizetesting.com/challenge.json"

def call(link = CHALLENGE_URL)
    response_link, message = fetch_data(link)
    puts "Final Message #{response_link}" if message.nil?
    
    unless message.nil?
      new_url = CHALLENGE_URL+"?id=#{get_query_params(response_link)["id"]}"
      puts "New Url: #{new_url}"
      puts "Message: #{message}"
      call(new_url)
    end 
end

def fetch_data(link)
  uri = URI.parse(link)
  response = Net::HTTP.get(uri)
  JSON.parse(response).values
end

def get_query_params(response_link)
  new_uri = URI.parse(response_link)
  URI.decode_www_form(new_uri.query).to_h
end

# 503047199

puts call
