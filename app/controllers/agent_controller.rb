class AgentController < ApplicationController
    #creating object for an agent
    def new
        @agent=Agent.new()
        
    end

    #agent creation/Admin/agent
    def create
        @agent=Agent.new(agent_params)
        if @agent.role.eql?('Agent')
            @agentflag=1
            password=@agent.email.split('@')[0]
            @agent.password=(password.concat("@A123"))
        end
        @company=Company.where(flag: nil)
        @agent.save!
        @company.update(flag:1)
        #sending email to the agents when their account has crerted
        if(@agent.role.eql?('Agent'))
            UserMailer.yourlogincredentials(@agent,@agent.password).deliver_now
            redirect_to display_prop_path,notice:"Agent created successfully"
        end
        if (@agent.role.eql?('Admin'))
        redirect_to new_agent_session_path
        end
    end

    #display the properties on agent page
    def show
    @agent=current_agent
    @company=@agent.company
  	@properties = @company.properties 
    end

    #display the approach list on properties
    def viewapproach
        @approach=Approach.new()
        @property=Property.find(params[:id])
        @approachlist=Approach.where(property_id:@property.id).all
        if @property.flag == 1  
        @rentedp=Rentedlist.where(property_id: @property.id).take
        end
    end

    #adding the renters who approached that particular property
    def addapproach
        @approach=Approach.new()
        @property=Property.find(params[:id])
        @renter=current_renter
        @approach.property_id=@property.id
        @approach.renter_id=@renter.id
        @approach.approachflag = 1
        if @approach.save
        redirect_to viewproperty_path(@property)
        else
        redirect_to viewproperty_path(@property), notice: "Unable to add approaches soryy!!try after some months"
        end
    end
   

    #edit image section
    def delimage
        @property=Property.find(params[:id])
                
    end

    #deleting an particular image 
    def delete_image_attachment
        
            @image = ActiveStorage::Attachment.find(params[:id])
            @image.purge
            redirect_back(fallback_location: request.referer) 
    end


    #creating objects for adding sub agents
    def addagents
        @agent=Agent.new()
    end
    




      def viewagents
        @agent=Agent.where(company_id:current_agent.company_id).all
      end
    #params for the agent creation
    private 
  def agent_params 
    params.require(:@agent).permit(:email, :password, :contact, :address, :name, :role,:company_id)
  end 
  
      
end
