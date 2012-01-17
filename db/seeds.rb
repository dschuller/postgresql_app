# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create(firstname: 'Dietmar', lastname: 'Schüller', email: 'dietmar@schuller-muller.de', phone: '02305-891372', mobile: '0151-11343322', password: 'ted4ever', is_admin: true, is_guestplayer: false)

# Generate matchdays for the upcoming 12 months
next_sunday  = Date.today +  (7 - Date.today.wday)
while next_sunday < Date.today + 365
	# Create database entry
	md = Matchdate.new(:date => next_sunday, :note => '')
	md.save
	next_sunday = next_sunday + 7
end
