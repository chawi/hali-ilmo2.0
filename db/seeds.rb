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
		Course.delete_all
		puts "db reset \n"
	end

	ENV['kursseja'].to_i.times do |n|
		
		c = rand(courseAr.length)
		#puts "#{c} random \n"
		Course.create(:name => courseAr[c][0], :description => courseAr[c][1])	
	end			

	puts "#{ENV['kursseja']} courses added"



