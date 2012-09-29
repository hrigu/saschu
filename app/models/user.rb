class User < ActiveRecord::Base
  MALE = 0
  FEMALE = 1

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable #password_length: See config/initializers/devisec.rb
         #:confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :age

  belongs_to :rolable, :polymorphic => true

  def has_role? role_id
    rolable_type == role_id.to_s.capitalize
  end

  def is_admin?
    has_role? :administrator
  end

  def is_parent?
    has_role? :parent
  end

  def is_student?
    has_role? :student
  end

  def name
    return [first_name, last_name].join " "
  end

  def self.all_not_confirmed
    User.where("confirmed_at is NULL")
  end


end
