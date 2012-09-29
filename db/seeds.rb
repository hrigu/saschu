# -*- encoding : utf-8 -*-

class UserCreator
  def create_user user_desc
    user_desc.each do |u|
      role = u.delete(:role)
      u[:password_confirmation] = u[:password]
      user = User.new u
      user.skip_confirmation!
      user.save!
      add_role(user, role)
      puts 'New user created: ' << user.first_name
    end
  end

  def add_role user, role
    role = case role[:type]
             when :administrator
               Administrator.create!
             when :student
               values = role[:values]
               puts values
               class_name = values.delete :class_name
               s = Student.create! values
               s.school_class = SchoolClass.find_by_name(class_name)
               s.save
               s
             when :parent
               Parent.create!
           end
    user.rolable = role
    user.save
  end
end

class CourseCreator
  def create_course course_desc
    course_desc.each do |c|
      parent = c.delete :parent
      course = Course.new c
      course.parent = User.find_by_email(parent).rolable
      course.save
      puts 'New course created: ' << course.title
    end
  end
end


#############################
#                           #
#    create db entries      #
#                           #
#############################

seed_data_root = "#{Rails.root.to_s}/db/seed_data"
user_desc = YAML::load(File.open("#{seed_data_root}/users.yml"))
course_desc = YAML::load(File.open("#{seed_data_root}/courses.yml"))
classes = %w[1a 1b 1c 2a 2b 2c 3a 3b 3c 4a 4b 4c 5a 5b 5c 6a 6b 6c]

puts 'SETTING UP School classes'
classes.each do |name|
  SchoolClass.create! name: name
end


puts 'SETTING UP States'
State.create! name: State::KURSE_EINGEBEN, active: true
State.create! name: State::KURSE_BUCHEN, active: false

puts 'SETTING UP DEFAULT USER LOGIN'
UserCreator.new.create_user user_desc

puts 'SETTING UP Courses'
CourseCreator.new.create_course course_desc

puts 'SETTING UP ChoosenCourses'
cc = ChoosenCourse.new(priority:1)
cc.student = (User.find_by_first_name "Benedikt").rolable
cc.course = (User.find_by_first_name "Meister").rolable.course
cc.save




