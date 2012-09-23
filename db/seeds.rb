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
    class_name: "5c",
    sex: User::MALE,
    role: "student"
}

]
#user = User.create! f
#puts 'New user created: ' << user.name

users.each do |u|
  role = u.delete(:role)
  u[:password_confirmation] = u[:password]
  user = User.create! u
  user.add_role role
  user.save
  puts 'New user created: ' << user.first_name
end
