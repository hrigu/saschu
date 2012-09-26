class Course < ActiveRecord::Base
  attr_accessible :class_max, :class_min, :description, :title, :where, :num_of_students
  belongs_to :parent
end
