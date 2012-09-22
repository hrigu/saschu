puts 'SETTING UP DEFAULT USER LOGIN'
#user = User.create! first_name: 'Christian', last_name: 'Muehlethaler', email: 'chmuehlethaler@freesurf.ch', :password => 'please', :password_confirmation => 'please'
#user.add_role :admin
#puts 'New user created: ' << user.name

user2 = User.create! first_name: 'Benedikt', last_name: 'Muehlethaler', email: 'bene@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.first_name
