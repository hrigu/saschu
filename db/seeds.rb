puts 'SETTING UP DEFAULT USER LOGIN'
users = [
{
    first_name: 'Christian',
    last_name: 'Muehlethaler',
    email: 'chmuehlethaler@freesurf.ch',
    password: 'please',
    #user.add_role :admin
},
{
    first_name: 'Benedikt',
    last_name: 'Muehlethaler',
    email: 'bene@gmail.com',
    password: 'please',
}

]
#user = User.create! f
#puts 'New user created: ' << user.name

users.each do |u|
  u[:password_confirmation] = u[:password]
  user = User.create! u
  puts 'New user created: ' << user.first_name
end
