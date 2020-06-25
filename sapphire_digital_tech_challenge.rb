require 'httparty'
require 'pry'
# code challenge came from https://github.com/Vitals-Interns/intern-goals/blob/master/interview_challenges/HCSC_api_deploys.md

response = HTTParty.get('https://gist.githubusercontent.com/gretchenziegler/853c4f709d45176aa44c8e5aee864cac/raw/010a4c44455ffc93b8039935cfc4e0dff41ae502/hcsc.json')

parsed_response = JSON.parse(response)

deployed_at = parsed_response.map do |call|
  call.last.map do |rows|
    rows.dig('most_recent_deploys', 'platform-api', 'deployed_at')
  end
end.flatten

puts "#{deployed_at}"
