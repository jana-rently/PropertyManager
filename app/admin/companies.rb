ActiveAdmin.register Company do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :companyname, :location, :about, :year, :flag
  #
  # or
  #
  # permit_params do
  #   permitted = [:companyname, :location, :about, :year, :flag]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs :companyname, :location, :about, :year, :flag
    actions
    end
  
end
