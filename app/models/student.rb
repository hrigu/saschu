class Student < ActiveRecord::Base
  attr_accessible :age, :sex, :school_class_id
  has_one :user, as: :rolable, :dependent => :delete
  belongs_to :school_class
end
