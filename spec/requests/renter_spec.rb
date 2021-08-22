require 'rails_helper'
RSpec.describe "Renters", type: :request do
  require 'rails_helper'

  let!(:@renter){
    @renter =FactoryGirl.create(:renter)
    @renter.confirm
  }

  context 'Signup page of Renter' do 
    it 'checks whether the form element is available in that page or not  ' do 
      
      get new_renter_registration_path

      #expect(response.body).to have_tag('form')
      expect(response.body).to have_tag('form') do

        #checking the presence of renter name field
        with_tag "input", :with => { :name => "renter[name]", :type => 'text' }

        #checking the presence of renter email field 
        with_tag "input", :with => { :name => "renter[email]", :type => 'email' }

        #checking presence of the renter contact field 
        with_tag "input", :with => { :name => "renter[contact]", :type => 'text' }

        #checking presence of the address field
        with_tag "textarea", :with => { :name => "renter[address]" }

        #checking presence of password field
        with_tag "input", :with => { :name=>"renter[password]", :type => 'password' }

        #checking the presence of the submit button
        with_tag "input", :with => { :name=>"commit", :type => 'submit' }
      end
    end
  end


  context 'Login page of Renter' do 
    it 'checks whether the form element is available in that page or not  ' do 
    
      get new_renter_session_path
      #expect(response.body).to have_tag('form')
      expect(response.body).to have_tag('form') do
        #checking presence of email field
        with_tag "input", :with => { :name => "renter[email]", :type => 'email' }
    
        #checking presence of password field
        with_tag "input", :with => { :name=>"renter[password]", :type => 'password' }
    
        #checking the presence of the submit button
        with_tag "input", :with => { :name=>"commit", :type => 'submit' }

      end
      
    end
  end
  
  context 'After Successfull Login of Renter' do 

    #checking the show page after the successful login of the renter
    it 'renders the all properties display' do
      sign_in @renter
      get view_prop_path
      expect(response).to render_template 'renter/show'
    end

    #checking the rented page 
    it 'renders the all rentedlist display' do
      sign_in @renter
      get rentedlistp_path
      expect(response).to render_template 'properties/showrented'
    end

    #checking the wishlist page
    it 'renders the all properties wishlist' do
      sign_in @renter
      get wishlistp_path
      expect(response).to render_template 'properties/showwish'
    end
    
    #checking the approaches
    it 'renders the all properties approaches ' do
      sign_in @renter
      get applied_list_path
      expect(response).to render_template 'renter/applied'
    end
          
  end	


  context 'After Clicking a particular property' do 
   
    it "shows the about page of the particular property" do
  
      #creating company for assigning the property to that company
      @company=FactoryGirl.create(:company)
  
      #creating a property and assigning to company
      @property=FactoryGirl.create(:property,company_id:@company.id)
  
      #passing the property id to render the view page of that particular propety
      sign_in @renter
  
      get viewproperty_path(id:@property.id)
      expect(response).to render_template 'properties/show'
    
    end
  end

  context 'If the particular property is available for application' do 
   
    it "shows the about page of the particular property" do
  
      #creating company for assigning the property to that company
      @company=FactoryGirl.create(:company)
  
      #creating a property and assigning to company
      @property=FactoryGirl.create(:property,company_id:@company.id)
  
      #passing the property id to render the view page of that particular propety
      sign_in @renter
      get addapproach_path(id:@property.id)
      @id=@property.id
      expect(response).to redirect_to "/view_property/#{@id}"
    
    end
  end
  describe Rentedlist do
  
    #callback implementation for sending mails to accepted renters and unaccepted renters about their status of application
  
    context "Call backs for sending email to renters about their applicaiton status" do
  
      it "checks the email sent or not" do 
  
        @company=FactoryGirl.create(:company)
        @agent =FactoryGirl.create(:agent,company_id:@company.id)
        @agent.confirm
        @property=FactoryGirl.create(:property,company_id:@company.id)
  
        #building a rented list using factory girl
  
        @renter=Renter.first
        @approach=FactoryGirl.create(:approach,property_id:@property.id,renter_id:@renter.id) 
        @rentedlist = FactoryGirl.build(:rentedlist,renter_id:@renter.id, property_id:@property.id)
        @rentedlist.save
     
        #Expected to call the sendmail method afte the renter has approved
        is_expected.to callback(:send_mail).after(:save) 
  
      end
      
    end

  end  

end