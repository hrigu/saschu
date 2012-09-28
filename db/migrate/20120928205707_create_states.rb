class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.boolean :active, default: false

      t.timestamps
    end

    State.create! name: State::KURSE_EINGEBEN, active: true
    State.create! name: State::KURSE_BUCHEN, active: false

  end
end
