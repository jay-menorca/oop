class Person
	attr_accessor :name 

	def sayHi
		puts "\nHi! my name is #{@name}."
	end
end

class Student < Person
	def learn
		puts "\nI get it"
	end
end

class Instructor < Person
	def teach
		puts "\nEverything in ruby is an object"
	end
end

teacher1 = Instructor.new
teacher1.name = "Chris"
teacher1.sayHi

student1 = Student.new
student1.name = "Cristina"
student1.sayHi

teacher1.teach
student1.learn

#might fail, i guess
=begin
ok. the line below threw an exception... 
undefined No method exception. Pretty much straightforward - 
Student class doesn't have a .teach() 'behavior', 
thus, the exception
=end

#student1.teach