puts 'SETTING UP School classes'

classes = %w[1a 1b 1c 2a 2b 2c 3a 3b 3c 4a 4b 4c 5a 5b 5c 6a 6b 6c]
classes.each do |name|
  SchoolClass.create! name: name
end


puts 'SETTING UP DEFAULT USER LOGIN'
user_desc = [
    {
        first_name: 'Christian',
        last_name: 'Muehlethaler',
        email: 'chmuehlethaler@freesurf.ch',
        password: 'please',
        role: {
            type: :admin
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
    }

]

class UserCreator
  def create_user user_desc
    user_desc.each do |u|
      role = u.delete(:role)
      u[:password_confirmation] = u[:password]
      user = User.create! u
      add_role(user, role)
      puts 'New user created: ' << user.first_name
    end
  end

  def add_role user, role
    role = case role[:type]
             when :admin
               Admin.create!
             when :student
               values = role[:values]
               puts values
               class_name = values.delete :class_name
               s = Student.create! values
               s.school_class = SchoolClass.find_by_name class_name
             when :parent
               Parent.create!
           end
    user.rolable = role
    user.save
  end
end

UserCreator.new.create_user user_desc


