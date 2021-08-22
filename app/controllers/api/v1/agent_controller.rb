module API
    module V1
        class Api::V1::AgentController < ApplicationController
            before_action :doorkeeper_authorize! 
             respond_to :json
             
            
            def current_agent
                @current_agent ||= Agent.find_by(id: doorkeeper_token[:resource_owner_id])
            end


            #custom api to get the applications of a partiuclar property
            def applied
                # Only Admin Agents are allowed to view the applications
                if current_agent.role.eql?('Admin')
                    #to remove the propertyid couldnt found exception
                    begin    
                        property=Property.find(params[:id])
                    rescue Exception => e  
                    
                    end
                    #to check if the property id passed is valid
                    if property !=nil 
                        @property=Property.where(id:property.id,company_id:current_agent.company_id).take
                        @applied=Approach.where(property_id:@property.id)
                        render json:{status: :'success',data:@applied}
                    else
                        #if there is no property found 
                        render json:{status: :'No property with the specified id'}
                    end
                else
                    #if he is not an admin agent
                    render json:{staus: :'Unauthorized only admins can view the details'}
                end

            end
        end 

    end 

end 