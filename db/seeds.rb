# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#	cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

	courseAr = [["LaMa","Säkin voit selvitä lamasta"],
		    ["Tsoha","Oi että, jos tämän olisi voinut tehdä railsilla."],	    ["TiRa","TiRa kuulostaa joltakin linnulta."],
		    ["KäSu","Käyttöliittymiä pohditaan"],
		    ["OhPe","Tästä sä voit aloittaa"],
		    ["Java","Sä voit luennoida pöydältä"],
		    ["TiKaPe","Sä voit pohtia tietokantoja"],
		    ["XML","Kiva oli kesäkurssina tämä"]]

	if ENV['del']
		Course.destroy_all
		CourseInstance.destroy_all
		ExerciseGroup.destroy_all
		puts "db reset \n"
	end

	ENV['kursseja'].to_i.times do |n|
		
		c = rand(courseAr.length)
		#puts "#{c} random \n"
		c =	Course.create(:name => courseAr[c][0], :description => courseAr[c][1])	
		d = CourseInstance.create(:instance_name=>"Kevät 2008", :course_id=>c.id)

		ExerciseGroup.create(:name=>"Mon 12-14 B121", :course_instance_id=>d.id)
		ExerciseGroup.create(:name=>"Tue 12-14 C121", :course_instance_id=>d.id)
		ExerciseGroup.create(:name=>"Tue 16-18 B122", :course_instance_id=>d.id)			

		e = CourseInstance.create(:instance_name=>"Syksy 2009", :course_id=>c.id)		

		ExerciseGroup.create(:name=>"Mon 12-14 B121", :course_instance_id=>e.id)
		ExerciseGroup.create(:name=>"Tue 12-14 C121", :course_instance_id=>e.id)
		ExerciseGroup.create(:name=>"Tue 16-18 B122", :course_instance_id=>e.id)			

		f = CourseInstance.create(:instance_name=>"Kevät 2009", :course_id=>c.id)		

		ExerciseGroup.create(:name=>"Mon 12-14 B121", :course_instance_id=>f.id)
		ExerciseGroup.create(:name=>"Tue 12-14 C121", :course_instance_id=>f.id)
		ExerciseGroup.create(:name=>"Tue 16-18 B122", :course_instance_id=>f.id)			
		
	end			

	puts "#{ENV['kursseja']} courses added"



