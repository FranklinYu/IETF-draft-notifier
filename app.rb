# frozen_string_literal: true

require 'sinatra'

get '/' do
  redirect '/subscribe'
end

get '/subscribe' do
  haml :subscribe
end

post '/subscribe' do
  haml :confirm
end
