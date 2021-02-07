require 'uri'
require 'net/http'
require 'openssl'

class SearchController < ApplicationController
    def find()
        puts 'looking for ' + params[:name] + '...'
        url = URI("https://jikan1.p.rapidapi.com/search/anime?q=" + params[:name])
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = # KEY
        request["x-rapidapi-host"] = # HOST
        response = http.request(request)
        parsed_json = JSON.parse(response.body)
        @image_link = parsed_json['results'][0]['image_url']
        render inline: "<%= image_tag @image_link %>"
    end
end