require 'rails_helper'

RSpec.describe "Agents", type: :request do
  before do
    @company=FactoryGirl.create(:company)
    @agent =FactoryGirl.create(:agent,company_id:@company.id)
    @agent.confirm
    
  end

  #validating the elements in the agent signup page
  context 'Signup page of Agent' do 
    it 'checks whether the form element is available in that page or not  ' do 
      
      get new_agent_registration_path

      #expect(response.body).to have_tag('form')
      expect(response.body).to have_tag('form') do
      
      #checking the presence of agent name field
      with_tag "input", :with => { :name => "agent[name]", :type => 'text' }
      
      #checking the presence of agent email field 
      with_tag "input", :with => { :name => "agent[email]", :type => 'email' }
      
      #checking presence of the agent contact field 
      with_tag "input", :with => { :name => "agent[contact]", :type => 'text' }
      
      #checking presence of the agent field
      with_tag "textarea", :with => { :name => "agent[address]" }
      
      #checking presence of agent field
      with_tag "input", :with => { :name=>"agent[password]", :type => 'password' }
      
      #checking the presence of the submit button
      with_tag "input", :with => { :name=>"commit", :type => 'submit' }

      end
    end
  end

  #Validating the elements in agent login page
  context 'Login page of Agent' do 
    it 'checks whether the form element is available in that page or not  ' do 
      
      get new_agent_session_path
      
      #expect(response.body).to have_tag('form')
      expect(response.body).to have_tag('form') do
      
      #checking presence of email field
      with_tag "input", :with => { :name => "agent[email]", :type => 'email' }
      
      #checking presence of password field
      with_tag "input", :with => { :name=>"agent[password]", :type => 'password' }
      
      #checking the presence of the submit button
      with_tag "input", :with => { :name=>"commit", :type => 'submit' }
      end

    end

  end

  #validating if the page is rendered successfully or not
  context 'After Successfull Login of Agent' do 
    it 'renders agent show page after logged in' do
      sign_in @agent
      get displaying_prop_path
      expect(response).to render_template 'agent/show'
    end
  end	
  

end
