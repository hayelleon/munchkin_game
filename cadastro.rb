require 'json'
require 'sinatra'
require 'sinatra/json'
require 'pry'
require 'securerandom'
require_relative "room"

get '/' do
  @titulo = 'HORA DE MAAAAATAAAAAAAAARRRRR!!!!! (Não o Maurício...)!'
  erb :index
end

post '/rooms' do
  room_data = params['data']
  created_room = Room.new(SecureRandom.uuid, room_data['name'], Time.now)

  json(
    status: 'created',
    data: {
      uuid: created_room.uuid,
      name: created_room.name
    },
    server_time: Time.now
  )
end
