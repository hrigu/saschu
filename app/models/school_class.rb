class SchoolClass < ActiveRecord::Base
  attr_accessible :name
  has_many :users
end
