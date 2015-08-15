# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Rod', email: 'ozaki90@gmail.com', level: '1')
User.create(name: 'Tim', email: 'ts.tim.lo@gmail.com', level: '2')
