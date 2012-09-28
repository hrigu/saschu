class Student < ActiveRecord::Base
  attr_accessible :age, :sex, :school_class_id
  has_one :user, as: :rolable, :dependent => :delete
  belongs_to :school_class
  has_many :choosen_courses
  has_many :courses, :through => :choosen_courses

  def definitive_course
    choosen_courses.where(:definitive => true).limit(1).first
  end

#  has_and_belongs_to_many :courses

  def to_s
    user.nil? ? "unbekannt" : user.name
  end
end
