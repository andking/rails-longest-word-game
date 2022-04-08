require 'open-uri'
require 'json'

class GamesController < ApplicationController

    def new
        # @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
        @letters  = Array.new(10) { ('A'..'Z').to_a.sample }.join
    end

    def score
        @words = params[:word]
        @letters = params[:letters].split(',')
        @result = ''
        if english_word? && include?
    @result1 =  "Congratilations! #{@words} is a valid English word!"
        elsif include?
            @result1 = "Sorry but #{@words} can't be built out of #{@letters}"
else
    @result1 =  "Sorry, but #{@words} does not seem to be a valid English word..."
    end
    end

    def english_word?
        response = URI.open("https://wagon-dictionary.herokuapp.com/#{@words}")
        json = JSON.parse(response.read)
        return json[:word].split(',')
    end

def include?
    # @letters.grep(@words)
    @letters.select {|s| s.include? @words}
end
end
