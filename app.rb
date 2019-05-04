# frozen_string_literal: true

require 'sinatra'

get '/' do
  redirect '/subscribe'
end

get '/subscribe' do
  haml :'subscription/new'
end

post '/subscribe' do
  haml :'subscription/create'
end
