class Newsfeed < ActiveRecord::Base

	named_scope :newsfeed_descending, :order => "created_at DESC"

	def self.user_registered(user)
		create :message => "#{user.username} rekisteröytyi käyttäjäksi."
	end

	def self.course_added(course)
		create :message => "Uusi kurssi #{course.name} lisätty järjestelmään."
	end
	
	def self.into_exercise_group(user, exgroup)
		create :message => "#{user.username} liittyi kurssille #{exgroup.course_instance.course} ryhmään #{exgroup.name}"
	end

end
