class Newsfeed < ActiveRecord::Base

	def self.user_registered(user)
		create :message => "#{user.username} rekisteröytyi käyttäjäksi."
	end

	def self.course_added(course)
		create :message => "Uusi kurssi #{course.name} lisätty järjestelmään."
	end
	
	def self.into_exercise_group(user, exgroup)
		create :message => "#{user.username} liittyi ryhmään #{exgroup.name}"
	end

end
