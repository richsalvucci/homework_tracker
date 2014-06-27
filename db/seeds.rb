# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new (name: 'User',
  email:'user@test.com',
  password: '12345678',
  admin: '0')

u = User.new (name: 'Admin',
  email:'admin@test.com',
  password: '12345678',
  admin: '1')

Location.create!(
  name: 'Charleston, SC',
  )

Location.create!(
  name: 'Atlanta, GA',
  )

Location.create!(
  name: 'Houston, TX',
  )

Course.create!(name: 'Ruby on Rails',
  location_id: '1')

Course.create!(name: 'Front End Engineering',
  location_id: '1')

Course.create!(name: 'iOS',
  location_id: '1')

Course.create!(name: 'Ruby on Rails',
  location_id: '2')

Course.create!(name: 'Front End Engineering',
  location_id: '2')

Course.create!(name: 'iOS',
  location_id: '2')

Course.create!(name: 'Ruby on Rails',
  location_id: '3')

Course.create!(name: 'Front End Engineering',
  location_id: '3')

Course.create!(name: 'iOS',
  location_id: '3')
