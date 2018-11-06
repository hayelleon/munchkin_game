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
    uuid: created_room.uuid,
    name: created_room.name
  }

  room_storage = PStore.new('storage/munchkin_rooms.pstore')
  room_storage.transaction do
    room_storage[:rooms] ||= []
    room_storage[:rooms].push(munchkin_room)
  end

  json(
    status: 'created',
    server_time: Time.now,
    data: munchkin_room
  )
end
