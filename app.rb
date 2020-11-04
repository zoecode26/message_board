require 'sinatra/base'
require_relative 'lib/message_list'

class MessageBoard < Sinatra::Base
  set :public_folder, 'public'

  get '/' do
    @message_list = MessageList.all
    erb :index
  end

  post '/' do
    @name = params[:name]
    @message = params[:message]
    MessageList.add(@name, @message)
    redirect '/'
  end

  get '/message' do
    erb :message
  end

  run! if app_file == $0
end
