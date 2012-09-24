class Teacher < ActiveRecord::Base
  has_one :user, as: :rolable
  has_one :school_class
end
