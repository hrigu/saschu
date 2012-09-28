class State < ActiveRecord::Base
  attr_accessible :active, :name

  KURSE_EINGEBEN = "kurse_eingeben"
  KURSE_BUCHEN = "kurse_buchen"

  def self.active_state_name
    State.find_by_active(true).name
  end

  def self.state_is_kurse_eingeben?
    self.active_state_name == KURSE_EINGEBEN
  end

  def self.state_is_kurse_buchen?
    self.active_state_name == KURSE_BUCHEN
  end

end
