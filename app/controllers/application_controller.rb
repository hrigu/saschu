class ApplicationController < ActionController::Base
  protect_from_forgery


  # Alle Authorisierungsexceptions kommen hier durch. Hier wird entschieden, wohin der Benutzer geroutet wird.
  # Dort sieht er die Meldung, warum er etwas nicht machen durfte.
  # Die Meldungen sind in 'config/locales/cancan.de.yml' definiert
  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    redirect_to root_path, alert: exception.message
  end

  private

  #Devise::Controllers::Helpers
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope.rolable_type
      when "Administrator"
        admin_root_path
      when "Parent"
        my_courses_path
      when "Student"
        choose_courses_path
    end

  end

end
