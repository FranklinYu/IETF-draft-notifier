# frozen_string_literal: true

require 'dotenv/load'
require 'mail'
require 'sinatra'

Mail.defaults do
  delivery_method(
    :smtp,
    address: ENV['SMTP_SERVER'],
    port: ENV['SMTP_PORT'],
    user_name: ENV['SMTP_USERNAME'],
    password: ENV['SMTP_PASSWORD'],
    tls: true
  )
end

get '/' do
  redirect '/subscribe'
end

get '/subscribe' do
  haml :'subscription/new'
end

post '/subscribe' do
  halt 400 if params[:name].nil? || params[:email].nil?
  smtp_sender = "#{ENV['SMTP_SENDER_NAME']} <#{ENV['SMTP_SENDER_ADDRESS']}>"
  Mail.deliver(
    from: smtp_sender,
    to: params[:email],
    subject: "Subscription confirmation for [#{params[:name]}]",
    content_type: 'text/html',
    body: haml(:'subscription/mail', layout: false)
  )
  haml :'subscription/create'
end
