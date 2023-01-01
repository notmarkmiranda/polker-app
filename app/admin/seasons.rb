ActiveAdmin.register Season do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :league_id, :active, :completed, :number_of_games
  #
  # or
  #
  # permit_params do
  #   permitted = [:league_id, :active, :completed, :number_of_games]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
