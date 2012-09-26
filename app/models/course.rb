class Course < ActiveRecord::Base
  attr_accessible :class_max, :class_min, :description, :title, :where, :num_of_students
  belongs_to :parent
  #has_and_belongs_to_many :students
  has_many :choosen_courses
  has_many :students, :through => :choosen_courses
end
