 class TweetsController < ApplicationController
  def index
  	@tweets = twitter_client.user_timeline(ENV['TW_HANDLE'])
  end

  def create
  	res = twitter_client.update(params[:tweet])
  	render json: { tweet: res }
  end

  private

  def twitter_client
  	@twitter_client ||= Twitter::REST::Client.new do |config|
  		config.consumer_key = ENV['TW_CONSUMER_KEY']
  		config.consumer_secret = ENV['TW_CONSUMER_SECRET']
  		config.access_token = ENV['TW_ACCESS_TOKEN']
  		config.access_token_secret = ENV['TW_ACCESS_TOKEN_SECRET']
  	end
  end

end
