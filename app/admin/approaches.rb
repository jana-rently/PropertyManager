ActiveAdmin.register Approach do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :property_id, :renter_id, :approachflag
  #
  # or
  index do
    selectable_column
    id_column
    column :property_id
    column :renter_id
    column :created_at
    column :updated_at
    actions
  end
  filter :property_id
  filter :renter_id
  # permit_params do
  #   permitted = [:property_id, :renter_id, :approachflag]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :property
end
