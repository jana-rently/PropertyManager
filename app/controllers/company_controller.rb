class CompanyController < ApplicationController
    #creating object for the company
    def new
        @company=Company.new()
        
    end

    #creating the company
    def create
        @company=Company.new(company_params)
        if @company.valid?

        @company.save
        redirect_to new_agent_registration_path
        else
            render 'new', notice:"Name can't be blank"
        end
        
    end

    #company parms
    private
    def company_params
        params.require(:@company).permit(:companyname, :location,:year,:about,:flag)
    end
end
