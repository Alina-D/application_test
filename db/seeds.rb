# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



u = User.create(email: 'test2@test.test', password: '123456')

Payment.create(user_id: u.id, starts_at: '2016-01-01', ends_at: '2016-12-30')
