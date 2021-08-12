ActiveAdmin.register Agent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :email, :password, :name, :role, :address, :contact, :company_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :name, :role, :address, :contact, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at, :company_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs :name,:email,:contact,:password,:role,:address,:company_id
    actions
    end
  
end
