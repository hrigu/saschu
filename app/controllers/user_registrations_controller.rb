class UserRegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    #TODO remove role from form
    rolable_type = params[:user].delete(:role)
    rolable = params[:user].delete(:rolable)

    super

#    rolable_type = rolable.delete(:rolable_type)
    school_class_id = rolable.delete(:school_class)

    #TODO wie kann man direkt die Schulklasse assignen?
    child_class = rolable_type.camelize.constantize
    if (rolable_type == "Student")
      resource.rolable = child_class.new(rolable)
      resource.rolable.school_class = SchoolClass.find school_class_id
    end
    resource.rolable = child_class.new()

    valid = resource.valid?
    valid = resource.rolable.valid? && valid

    #resource.add_role role


    resource.save
  end

  def edit
    super
  end

end
