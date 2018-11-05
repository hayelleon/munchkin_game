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
  room_data = params['data']
  created_room = Room.new(SecureRandom.uuid, room_data['name'])

  munchkin_room = {
    status: 'created',
    data: {
      uuid: created_room.uuid,
      name: created_room.name
    },
    server_time: Time.now
  }

  room_storage = PStore.new('storage/munchkin_rooms.pstore')
  room_storage.transaction do
    room_storage[:uuid] = munchkin_room[:uuid]
    room_storage[:name] = munchkin_room[:name]
  end

  puts room_storage.to_s

  json munchkin_room
end
