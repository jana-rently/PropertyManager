ActiveAdmin.register Property do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :city, :rent, :bedrooms, :description, :rented, :company_id, images: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :city, :rent, :bedrooms, :description, :flag, :company_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs :name, :address, :city, :rent, :bedrooms, :description, :rented
      f.inputs "Company" do
        f.input :company_id, as: :select, collection: Company.all.collect {|company| [company.companyname, company.id] }

      end
    f.input :images, as: :file, input_html: { multiple: true }
    actions
  end

    
  filter :name 
  filter :company_id
end
