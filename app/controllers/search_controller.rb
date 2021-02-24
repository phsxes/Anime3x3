require 'uri'
require 'net/http'
require 'openssl'

class SearchController < ApplicationController
    def find()
        puts 'looking for ' + params[:name] + '...'
        url = URI("https://jikan1.p.rapidapi.com/search/anime?q=" + params[:name])
        client = Jikan::Query.new
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ## API KEY HERE
        request["x-rapidapi-host"] = 'jikan1.p.rapidapi.com'
        response = http.request(request)
        parsed_json = JSON.parse(response.body)
        @results = parsed_json['results']
        respond_to do |format|
            format.js
        end

        # render inline: "<%= image_tag @image_link %>"
    end
end