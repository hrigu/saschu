class ChoosenCourse < ActiveRecord::Base
  attr_accessible :priority, :definitive

  validate :only_one_definitive_choosen_course_for_student

  belongs_to :student
  belongs_to :course


  def only_one_definitive_choosen_course_for_student
    errors.add(:definitive, "already a definitive course") unless student.choosen_courses.where("definitive is ?", true).empty?
  end
end
