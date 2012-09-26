class ChoosenCourse < ActiveRecord::Base
  attr_accessible :priority, :definitive

  belongs_to :student
  belongs_to :course
end
