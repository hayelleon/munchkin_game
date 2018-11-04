require 'pry'

class Room
	attr_reader :uuid, :name, :created_at

	def initialize (uuid, name, created_at)
		@uuid = uuid
		@name = name
		@created_at = created_at
	end

	def to_s
		"\nBem Vindo!\n
		 Sala #{name} criada!\n
		 Identificador: #{uuid}\n
		 Em #{created_at}\n"
	end
end
