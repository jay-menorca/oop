class Person
	def name
		@name
	end

	def getName
		return @name
	end

	def setName(name)
		@name = name
	end
end

someGuy1 = Person.new
someGuy1.setName("Jay")



puts "#{someGuy1.getName}"