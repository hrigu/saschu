class UserRegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    @student_stuff = params[:user].delete(:student)
    super
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

  protected

  def build_resource(hash=nil)
    super
    if State.state_is_kurse_buchen?
      if @student_stuff
        school_class_id = @student_stuff.delete(:school_class)
        resource.rolable = Student.new(@student_stuff)
        resource.rolable.school_class = SchoolClass.find school_class_id
      end
    elsif State.state_is_kurse_eingeben?
      resource.rolable = Parent.new()
    end
  end


end
