module API
  module V1
    class Api::V1::PropertiesController < ApplicationController
      before_action :doorkeeper_authorize! 
      respond_to :json

      #shows all the property belongs to the specific company of the agent
      def index
          @property=Property.where(company_id:current_agent.company_id).all
          
          if @property.blank?
            render json:{message: :'No property were present'}
          else
          respond_with @property
          end
      end

      #shows the particular property belongs to the company
      def show
        
        begin    
          @property=Property.find(params[:id])
        rescue Exception => e  
        end    
        if @property.nil?
            respond_with error: {error: 'No such property with that specified id.'}, status:400
        else
          if @property.company_id.eql?(current_agent.company_id)
          respond_with @property
          else
            respond_with error: {error: 'The specified property doesnot belongs to your company.'}
          end

        end
      end

      #creating the property
      def create
        #only admin agent of the company can able to create the property
        if current_agent.role.eql?('Admin')
        respond_with Property.create(name: params[:name],company_id: current_agent.company_id,images: params[:images],address: params[:address],rent: params[:rent],bedrooms: params[:bedrooms])
        else
          render json:{message: :'Unable to process your request,Only Admins can add the property'}
        end
      end

      # updating a specified property of the company
      def update
        begin    
          @property=Property.find(params[:id])
        rescue Exception => e  
        end
        #checks if the property is available or not
        if @property == nil
          render json:{message: :'No such property'}
          return

        end 
        #checks if he is a Admin agent or not
        if current_agent.role.eql?('Admin')
          if current_agent.company_id .eql? @property.company_id
            @property.update(updateparams)
            render json: {status: :'Success',message:'property updated',data:@property}
            return
          else
            render json: {status: :'This property doesnt belongs to your company'}
            return
          end
        else
          render json:{message: :'Unable to process your request,Only Admins can edit the property'}
          end
      end

      #destroying a specific property of the company
      def destroy
        property=Property.find(params[:id])
        if current_agent.role.eql?('Admin') and current_agent.company_id.eql? property.company_id
          property.destroy
          render json: {status: :'Success',message:'property deleted'}
        else
          render json:{message: :'Unable to process your request,Only Admins can destroy the property'}
        end

      end
      
      
      private
      def current_agent
        @current_agent ||= Agent.find_by(id: doorkeeper_token[:resource_owner_id])
      end
      def updateparams
        params.require(:property).permit(:name)
      end
      
    end
  end
end
