# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'


user_1 = User.create(username: 'user_1', email: 'user_1@example.com', password: '123456')
user_2 =  User.create(username: 'user_2', email: 'user_2@example.com', password: '123456')

date = Date.new(2016, 01, 5)
end_date = Date.new(2017, 03, 5)
month = (end_date - date).to_i / 30

(1..month).each {
  Payment.new(starts_at: date, ends_at: date.next_day(14), user_id: user_1.id).save
  Payment.new(starts_at: date.next_day(15),
              ends_at: date.next_month(1) - 1.day,
              user_id: user_2.id).save
  date = date.next_month(1)
}


