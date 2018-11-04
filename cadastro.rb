require 'json'
require 'sinatra'
require 'sinatra/json'
require 'pry'
require 'securerandom'
require 'pstore'
require_relative "room"

get '/' do
  @titulo = 'HORA DE MAAAAATAAAAAAAAARRRRR!!!!! (Não o Maurício...)!'
  erb :index
end

post '/rooms' do
  munchkin_rooms = PStore.new("munchkin_rooms.pstore")
  room_data = params['data']
  created_room = Room.new(SecureRandom.uuid, room_data['name'])

  json munchkin_room = {
    status: 'created',
    data: {
      uuid: created_room.uuid,
      name: created_room.name
    },
    server_time: Time.now
  }

  munchkin_rooms.transaction do
  munchkin_rooms[:munchkin_room] = munchkin_room.to_json
  end
end
