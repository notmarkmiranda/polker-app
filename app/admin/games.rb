ActiveAdmin.register Game do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :season_id, :date_time, :estimated_player_count, :location, :completed, :buy_in, :add_ons, :payout_schedule
  #
  # or
  #
  # permit_params do
  #   permitted = [:season_id, :date_time, :estimated_player_count, :location, :completed, :buy_in, :add_ons, :payout_schedule]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
