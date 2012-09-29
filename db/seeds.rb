# -*- encoding : utf-8 -*-

classes = %w[1a 1b 1c 2a 2b 2c 3a 3b 3c 4a 4b 4c 5a 5b 5c 6a 6b 6c]


user_desc = [
    {
        first_name: 'Christian',
        last_name: 'Muehlethaler',
        email: 'chmuehlethaler@freesurf.ch',
        password: 'please',
        role: {
            type: :administrator
        }
    },
    {
        first_name: 'Maria',
        last_name: 'Albisetti',
        email: 'maria.albisetti@gmail.com',
        password: 'please',
        role: {
            type: :parent
        }
    },
    {
        first_name: 'Betti',
        last_name: 'Bossi',
        email: 'bb@gmail.com',
        password: 'please',
        role: {
            type: :parent
        }
    },
    {
        first_name: 'Meister',
        last_name: 'Propper',
        email: 'mp@gmail.com',
        password: 'please',
        role: {
            type: :parent
        }
    },
    {
        first_name: 'Benedikt',
        last_name: 'Muehlethaler',
        email: 'bene@gmail.com',
        password: 'please',
        role: {
            type: :student,
            values: {
                sex: User::MALE,
                age: 11,
                class_name: "5c",
            }
        }
    },
    {
        first_name: 'Judith',
        last_name: 'Muehlethaler',
        email: 'judith@gmail.com',
        password: 'please',
        role: {
            type: :student,
            values: {
                sex: User::FEMALE,
                age: 9,
                class_name: "3c",
            }
        }
    },
    {
        first_name: 'Paula',
        last_name: 'Muehlethaler',
        email: 'paula@gmail.com',
        password: 'please',
        role: {
            type: :student,
            values: {
                sex: User::FEMALE,
                age: 6,
                class_name: "1a",
            }
        }
    },
    {
        first_name: 'Fritz',
        last_name: 'Fröhlich',
        email: 'ff@gmail.com',
        password: 'please',
        role: {
            type: :student,
            values: {
                sex: User::MALE,
                age: 12,
                class_name: "6b",
            }
        }
    }



]

course_desc = [
    {
        title: "Häkeln mit Pfiff",
        description: "Topflappen für den Heimgebrauch",
        capacity: 6,
        class_min: 4,
        class_max: 6,
        where: "Zuhause",
        chef: "maria.albisetti@gmail.com"
    },
    {
        title: "Kochen für Kinder",
        description: "Salzteigknusperli",
        capacity: 22,
        class_min: 1,
        class_max: 4,
        where: "Küche",
        chef: "bb@gmail.com"
    },
    {
        title: "Zimmer auf Hockglanz bringen",
        description: "Wir machen zuerst einen Saustall, dann putzen wir alles wieder",
        capacity: 11,
        class_min: 1,
        class_max: 6,
        where: "Bei dir im Zimmer",
        chef: "mp@gmail.com"
    }

]

class UserCreator
  def create_user user_desc
    puts 'SETTING UP DEFAULT USER LOGIN'

    user_desc.each do |u|
      role = u.delete(:role)
      u[:password_confirmation] = u[:password]
      user = User.create! u
      user.confirm!
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
    puts 'SETTING Courses'
    course_desc.each do |c|
      chef = c.delete :chef
      course = Course.new c
      course.parent = User.find_by_email(chef).rolable
      course.save
      puts 'New course created: ' << course.title
    end
  end
end

puts 'SETTING UP School classes'
classes.each do |name|
  SchoolClass.create! name: name
end


UserCreator.new.create_user user_desc
CourseCreator.new.create_course course_desc

cc = ChoosenCourse.new(priority:1)
cc.student = (User.find_by_first_name "Benedikt").rolable
cc.course = (User.find_by_first_name "Meister").rolable.course
cc.save

State.create! name: State::KURSE_EINGEBEN, active: true
State.create! name: State::KURSE_BUCHEN, active: false


