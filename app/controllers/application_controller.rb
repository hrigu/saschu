class ApplicationController < ActionController::Base
  protect_from_forgery


  # Alle Authorisierungsexceptions kommen hier durch. Hier wird entschieden, wohin der Benutzer geroutet wird.
  # Dort sieht er die Meldung, warum er etwas nicht machen durfte.
  # Die Meldungen sind in 'config/locales/cancan.de.yml' definiert
  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    redirect_to root_path, alert: exception.message
  end

end
