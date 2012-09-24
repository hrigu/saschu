class Course < ActiveRecord::Base
  attr_accessible :class_max, :class_min, :description, :title, :where
  belongs_to :parent
end
