module API
  module V1
    class Api::V1::PropertiesController < ApplicationController
      before_action :doorkeeper_authorize!
      respond_to :json

      def index
        @property=Property.all
        respond_with @property
      end

      def show
        
        @property=Property.find(params[:id])
          puts"#{@property}"
        if @property.nil?
            respond_with error: {error: 'No such property with that specified id.'}, status:400
        else
          respond_with @property
        end
      end

      def create
        respond_with Property.create(name: params[:name],company_id: params[:company_id],images: params[:images])
      end

      def update
        @property=Property.find(params[:id])
        @property.update(updateparams)
        render json: {status: :'Success',message:'property updated',data:@property}
      end

      def destroy
        property=Property.find(params[:id])
        if property.destroy
            render json: {status: :'Success',message:'property deleted'}
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
