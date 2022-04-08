require 'open-uri'
require 'json'

class GamesController < ApplicationController

    def new
        # @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
        # @letters  = Array.new(10) { ('A'..'Z').to_a.sample }.join

            @letters = []
              10.times do
                @letters << ('a'..'z').to_a.sample
              end
            return @letters

    end

    def score
        @words = params[:word].upcase
        @letters = params[:letters].upcase
        @result = ''

        if !(include?)
            @result1 = "Sorry but #{@words} can't be built out of #{@letters}"
        elsif english_word?
            @result1 =  "Congratilations! #{@words} is a valid English word!"
else
    @result1 =  "Sorry, but #{@words} does not seem to be a valid English word..."
    end
    end

    def english_word?
        response = URI.open("https://wagon-dictionary.herokuapp.com/#{@words}")
        json = JSON.parse(response.read)
        return json["found"]
    end

def include?
    @include = @words.chars.all? { |letter| @letters.include?(letter) }
end
end
