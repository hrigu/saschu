class UserRegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    rolable = params[:user].delete(:rolable)
    #TODO remove role from form
    params[:user].delete(:role)

    super

    rolable_type = rolable.delete(:rolable_type)
    school_class_id = rolable.delete(:school_class)

    #TODO wie kann man direkt die Schulklasse assignen?
    child_class = rolable_type.camelize.constantize
    resource.rolable = child_class.new(rolable)

    resource.rolable.school_class = SchoolClass.find school_class_id


    valid = resource.valid?
    valid = resource.rolable.valid? && valid

    #resource.add_role role



    resource.save
  end

  def edit
    super
  end

end
