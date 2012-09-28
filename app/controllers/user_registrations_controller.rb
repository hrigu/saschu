class UserRegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    student_stuff = params[:user].delete(:student)
    super
    if State.state_is_kurse_buchen?
      school_class_id = student_stuff.delete(:school_class)
      resource.rolable = Student.new(student_stuff)
      resource.rolable.school_class = SchoolClass.find school_class_id
    elsif State.state_is_kurse_eingeben?
      resource.rolable = Parent.new()
    end
    valid = resource.valid?
    valid = resource.rolable.valid? && valid
    if valid
      resource.rolable.save
      resource.save
    end

  end

  def edit
    super
  end

end
