class Student < ActiveRecord::Base
  attr_accessible :age, :sex
  has_one :user, as: :rolable
  belongs_to :school_class
end
