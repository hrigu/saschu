class Course < ActiveRecord::Base
  attr_accessible :class_max, :class_min, :description, :title, :where, :num_of_students
  belongs_to :parent
  #has_and_belongs_to_many :students
  has_many :choosen_courses
  has_many :students, :through => :choosen_courses

  def self.find_for_student student
    class_level = student.school_class.name.first.to_i
    Course.where("class_min <= :class_level AND class_max >= :class_level", {class_level: class_level})
  end

  def definitive_students
    choosen_courses.where(:definitive => true)
  end
end
