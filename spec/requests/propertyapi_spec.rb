require 'rails_helper'

RSpec.describe "Api V1 Properties", type: :request do
   

	before(:each) do
		@company=FactoryGirl.create(:company)
        @property=FactoryGirl.create(:property,company_id:@company.id)
	  end

	  context 'Un authorized access if he is an unauthorized one' do
		  it " status should return 401" do
			get '/api/v1/properties'
			expect(response).to have_http_status(:unauthorized)
		  end
	  end
	  
	  context 'Authorized access if he is an authorized one' do
		let(:application) { FactoryGirl.create(:application) }
		let(:agent)        { FactoryGirl.create(:agent,company_id:@company.id) }
		let(:token)       { FactoryGirl.create(:access_token, application: application, resource_owner_id: agent.id) }
	
		it 'Display all properties /index page ' do
		  get '/api/v1/properties', headers: { 'Authorization': 'Bearer ' + token.token }
		  
		  expect(response).to be_successful
		end	

        it 'show the particular property should return successful' do
            get '/api/v1/properties/45', headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
        end

        it 'Delete the property should return successful' do
            delete "/api/v1/properties/#{@property.id}", headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
          end

        it 'Update the Property should return successful' do
            put "/api/v1/properties/#{@property.id}", :params => {:property => { :name => "janpro"}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
          end

        #for Custom api to display the applied list  

        it 'show the particular property aplicaiotn list and it should return  successful' do
            get "/api/v1/applied/#{@property.id}", headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
        end
	end
end