class Room
	attr_reader :uuid, :name

	def initialize (uuid, name)
		@uuid = uuid
		@name = name
	end
end
