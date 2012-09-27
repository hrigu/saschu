class ChoosenCourse < ActiveRecord::Base
  attr_accessible :priority, :definitive

  validate :only_one_definitive_choosen_course_for_student

  belongs_to :student
  belongs_to :course


  scope :not_assigned, lambda {
    definitive_students = Student.uniq.joins(:choosen_courses).where("definitive = ?", true).pluck(:student_id)
    definitive_students = definitive_students.empty? ? '' : definitive_students
    where('student_id not in (?)', definitive_students)
  }
  scope :assigned, where(:definitive => true)

  def only_one_definitive_choosen_course_for_student
    if definitive
      errors.add(:definitive, "Student has already a definitive course") unless student.choosen_courses.where("definitive is ?", true).empty?
    end
  end

  def self.find_for_students_without_definitive
    definitive_students = Student.uniq.joins(:choosen_courses).where("definitive = ?", true).pluck(:student_id)
    definitive_students = definitive_students.empty? ? '' : definitive_students
    ChoosenCourse.where('student_id not in (?)', definitive_students)
  end
end
