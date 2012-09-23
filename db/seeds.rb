puts 'SETTING UP School classes'

classes = %w[1a 1b 1c 2a 2b 2c 3a 3b 3c 4a 4b 4c 5a 5b 5c]
classes.each do |name|
  SchoolClass.create! name: name
end


puts 'SETTING UP DEFAULT USER LOGIN'
users = [
{
    first_name: 'Christian',
    last_name: 'Muehlethaler',
    email: 'chmuehlethaler@freesurf.ch',
    password: 'please',
    role: "admin"
},
{
    first_name: 'Maria',
    last_name: 'Albisetti',
    email: 'maria.albisetti@gmail.com',
    password: 'please',
    role: "parent"
},
{
    first_name: 'Benedikt',
    last_name: 'Muehlethaler',
    email: 'bene@gmail.com',
    password: 'please',
    sex: User::MALE,
    age: 11,
    class_name: "5c",
    role: "student"
}

]

users.each do |u|
  role = u.delete(:role)
  name = u.delete(:class_name)
  u[:password_confirmation] = u[:password]
  user = User.create! u
  user.add_role role
  if name
    user.school_class = SchoolClass.find_by_name name
  end
  user.save
  puts 'New user created: ' << user.first_name
end