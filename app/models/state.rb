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

  #works only if it has two states
  def self.toggle
    all = State.all
    raise "more than two states" unless all.size == 2
    all.each do |s|
      s.active = !s.active
      s.save
    end

  end

end
