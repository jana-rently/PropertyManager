ActiveAdmin.register Review do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :rating, :reviews
  #
  # or
  #
  # permit_params do
  #   permitted = [:rating, :reviews, :property_id, :renter_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :rating
  filter :reviews
end
