require 'rails_helper'
RSpec.describe "Properties", type: :request do
  include RSpecHtmlMatchers
  
  before do
    @company=FactoryGirl.create(:company)
    @agent =FactoryGirl.create(:agent,company_id:@company.id)
    @agent.confirm
  end
  
  context 'For Admin Agent he can Add properties' do 
	  it 'after that admin agent can add propeteis ' do 
    	sign_in @agent
    	get addprop_path(id:@company.id)
    	expect(response).to render_template 'properties/new'
     end

    #validating the elemnts in the page

    it 'checks whether the form element is available in that page or not after the render of add property page ' do 
    	sign_in @agent
    	get addprop_path(id:@company.id)
    	  
        #expect(response.body).to have_tag('form')
        expect(response.body).to have_tag('form', :with => { :action => '/properties', :method => 'post' }) do
      
          #checking the presence of property name field
          with_tag "input", :with => { :name => "@properties[name]", :type => 'text' }
      
          #checking the presence of bedroom filed 
          with_tag "input", :with => { :name => "@properties[bedrooms]", :type => 'text' }
      
          #checking presence of the rent field 
          with_tag "input", :with => { :name => "@properties[rent]", :type => 'number' }
      
          #checking presence of the address field
          with_tag "input", :with => { :name => "@properties[address]", :type => 'text' }
      
          #checking presence of image field
          with_tag "input", :with => { :name=>"@properties[images][]", :type => 'file' }
      
          #checking the presence of the submit button
          with_tag "input", :with => { :name=>"commit", :type => 'submit' }
        end
    end
	  
    #validating the addagents page 
    it 'Admin agent can add propeties ' do 
      sign_in @agent
      get addagents_path
      expect(response).to render_template 'agent/addagents'
    end
      
    it ' checking the presence of all elements in the add agent path ' do 
     	sign_in @agent
      get addagents_path

      expect(response.body).to have_tag('form', :with => { :action => '/agentcreate', :method => 'post' }) do
        #checking the presence of agent name field
        with_tag "input", :with => { :name => "@agent[name]", :type => 'text' }
      
        #checking the presence of agent contact field
        with_tag "input", :with => { :name => "@agent[contact]", :type => 'text' }
        
        #checking presence of the email field
        with_tag "input", :with => { :name => "@agent[email]", :type => 'email' }
      
        #checking presence of agent role field
        with_tag "input", :with => { :name=>"@agent[role]", :type => 'hidden' }
      
        #checking the presence of the submit button
        with_tag "input", :with => { :name=>"commit", :type => 'submit' }

      end
   end


  #validating the subagents page
    it 'Admin agent View All other subagents who belongs to the company ' do 
      sign_in @agent
      get viewagents_path
      expect(response).to render_template 'agent/viewagents'
    end
       
           
  #validating the add properties page
    it 'Admin agent can add propeties ' do 
      sign_in @agent
      get addagents_path
      expect(response).to render_template 'agent/addagents'
    end
  
    #validating the presence of elements in addagents
    it ' checking the presence of all elements in the add agent path ' do 
      sign_in @agent
      get addagents_path
      expect(response.body).to have_tag('form', :with => { :action => '/agentcreate', :method => 'post' }) do
        
        #checking the presence of agent name field
        with_tag "input", :with => { :name => "@agent[name]", :type => 'text' }
      
        #checking presence of the email field
        with_tag "input", :with => { :name => "@agent[email]", :type => 'email' }
      
       #checking the presence of agent name field
       with_tag "textarea", :with => { :name => "@agent[address]"}
      
        #checking the presence of the submit button
        with_tag "input", :with => { :name=>"commit", :type => 'submit' }
      end
    end
	      
	end

end	


        

