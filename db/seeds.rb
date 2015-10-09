# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = []

20.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name)

  students << Student.create(name: name, email: email)
end

subjects = %w[History Biology Chemistry English]
room = 1

courses = []

subjects.each do |subject|
  courses << Course.create(name: subject, room: room)
  room += 1
end

grades = %w[A B C D F]

students.each do |student|
  courses.each do |course|
    Enrollment.create(student: student, course: course, grade: grades.sample)
  end
end
