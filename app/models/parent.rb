class Parent < ActiveRecord::Base
  has_one :user, as: :rolable
  has_one :course
end
