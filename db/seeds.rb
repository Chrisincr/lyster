# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:'Chris', email:'chrisincr@gmail.com', password:'2Private')
User.create(name:'Bob', email:'Bob@bob.com', password:'asdfasdf')
Tournament.create(name:'First Tourney', user:User.first, description:'The very first Tourney')
Tournament.first.combatants.create(user:User.first)
Tournament.first.combatants.create(user:User.last)
