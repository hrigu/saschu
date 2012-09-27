class Course < ActiveRecord::Base
  attr_accessible :class_max, :class_min, :description, :title, :where, :capacity
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

  def open_chooses
    ChoosenCourse.not_assigned.where(course_id: id)
    #choosen_courses.where(:definitive => false)
  end

  def free_places
    capacity - booked
  end

  def booked
    definitive_students.count
  end

end
