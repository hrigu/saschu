class UserRegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    role = params[:user].delete(:role)
    super
    resource.add_role role
    resource.save
  end

  def edit
    super
  end

end
