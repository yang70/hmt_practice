# has_many :through - Practice Rails Application

  <img src="https://s3-us-west-2.amazonaws.com/yangportfoliobucket/layoutpics/headshot.jpg" width="200">

By [Matthew Yang](http://www.matthewgyang.com).

## Description

This application was created to practice the `has_many :through` association in Rails.  I created this app and generated 3 resources that I wanted to associate: `Student`, `Course`, `Enrollment`.

The associations are:
* "A student has many courses through enrollment."
* "A course has many students through enrollment."
* "Enrollment belongs to student and course."

I established this in the models for each resource as follows:

Student
```ruby
class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, through: :enrollments
end
```

Course
```ruby
class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, through: :enrollments
end
```

Enrollment
```ruby
class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
end
```

I then generated a couple migrations to add a `student_id` and `course_id` column to the Enrollments table that also contains a grade for the given student and course.

The student table only has a name and email, the course table only a name and room number.

After migrating I was able to modify the views to show the relationship.  The Courses index lists all the courses created.  Going to the show page for a course lists the students that are associated to that course through an enrollment.  Going to the index page for students shows all students created, and going to the show page for a specific student displays the courses they are associated with through enrollments and the current grade for that course.

Having the associations makes bringing up information especially easy.  For example in the student show view, you have access to a specific student in the `@student` instance variable.  Accessing that students courses is then as simple as `@student.courses`. Because I set up the associations, Rails knows where to look to get that information.

## Special Notes

I was able to set up a `seed.rb` that I am pretty happy with that will seed the db with example data in order to see how this relationship works.
