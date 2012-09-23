class User < ActiveRecord::Base
  MALE = 0
  FEMALE = 1
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable #password_length: See config/initializers/devisec.rb

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :class_name, :age, :sex
  # attr_accessible :title, :body
end
