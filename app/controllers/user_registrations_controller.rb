class UserRegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    #TODO remove role from form
    rolable_type = params[:user].delete(:role)
    rolable = params[:user].delete(:rolable)
    super
    school_class_id = rolable.delete(:school_class)
    #TODO wie kann man direkt die Schulklasse assignen?
    child_class = rolable_type.camelize.constantize
    if (rolable_type == "student")
      resource.rolable = child_class.new(rolable)
      resource.rolable.school_class = SchoolClass.find school_class_id
    else
      resource.rolable = child_class.new()
    end
    valid = resource.valid?
    valid = resource.rolable.valid? && valid
    resource.rolable.save
    resource.save
  end

  def edit
    super
  end

end
