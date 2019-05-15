# frozen_string_literal: true

require 'dotenv/load'
require 'json/jwt'
require 'mail'
require 'sinatra'
require 'sinatra/activerecord'

require_relative 'models/subscription.rb'
require_relative 'models/ietf_draft.rb'

%w[
  JWS_KEY
  SMTP_SERVER
  SMTP_PORT
  SMTP_USERNAME
  SMTP_PASSWORD
  SMTP_SENDER_ADDRESS
].each { |env| raise "missing environment  variable #{env}" unless ENV.key?(env) }

jws_key = Base64.decode64(ENV['JWS_KEY'])

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
  halt 400 if params[:name].empty? || params[:email].empty?
  @sender_address = ENV['SMTP_SENDER_ADDRESS']
  @name = params[:name]
  @email = params[:email]
  jws = JSON::JWT.new(exp: 1.day.from_now, email: @email)
    .sign(jws_key, :HS256)
  @confirm_url = URI(url('/confirm'))
  @confirm_url.query = URI.encode_www_form(draft: @name, token: jws)
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

get '/confirm' do
  claim = JSON::JWT.decode(params[:token], jws_key)
  halt 400 if Time.at(claim[:exp]) < Time.now
  IetfDraft.find_by_name(params[:draft]).subscriptions.create(email: claim[:email])
  haml :confirm
end
