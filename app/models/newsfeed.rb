class Newsfeed < ActiveRecord::Base

	def self.user_registered(user)
		create :message => "#{user.username} rekisteröytyi käyttäjäksi."
	end

	def self.course_added(course)
		create :message => "Uusi kurssi #{course.name} lisätty järjestelmään."
	end
	
end
