require 'json'
require 'sinatra'
require 'pry'
require 'securerandom'
require_relative "room"
require_relative "rooms"

get '/' do
  @titulo = 'HORA DE MAAAAATAAAAAAAAARRRRR!!!!! (Não o Maurício...)!'
  erb :index
end

post '/rooms' do
  @titulo = 'ARRANQUEM UMA CABEÇA POR MIM!!!!'
  @room_data = params['data']

  @created_room = Room.new(SecureRandom.uuid, @room_data['name'], Time.now)

  erb :rooms
end