require 'sinatra'

salas = {
			sala: salas
		}

get '/' do
	@titulo = 'HORA DE MAAAAATAAAAAAAAARRRRR!!!!! (Não o Maurício...)!'
  	erb :index
end

post '/salas' do
  @titulo = 'ARRANQUEM UMA CABEÇA POR MIM!!!!'
  @salas  = params['salas']
  erb :salas
end