class SchoolClass < ActiveRecord::Base
  attr_accessible :name
  has_many :students
  belongs_to :teacher
end
