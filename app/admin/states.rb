ActiveAdmin.register State do

  actions :index

  collection_action :toggle do
    State.toggle
    redirect_to({action: :index}, notice: "toggled! #{State.active_state_name} is jetzt aktiv")
  end

  action_item :only => :index do
    link_to('toggle', action: :toggle)
  end
end
