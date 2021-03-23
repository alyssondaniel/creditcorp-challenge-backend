module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :set_company, only: [:show, :update, :destroy]

      # GET /companies
      def index
        @api_v1_companies = Company.all

        render json: @api_v1_companies
      end

      # GET /companies/1
      def show
        render json: @api_v1_company
      end

      # POST /companies
      def create
        @api_v1_company = Company.new(company_params)

        if @api_v1_company.save
          render json: @api_v1_company, status: :created, location: @api_v1_company_url
        else
          render json: @api_v1_company.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /companies/1
      def update
        if @api_v1_company.update(company_params)
          render json: @api_v1_company
        else
          render json: @api_v1_company.errors, status: :unprocessable_entity
        end
      end

      # DELETE /companies/1
      def destroy
        @api_v1_company.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_company
          @api_v1_company = Company.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def company_params
          params.require(:company).permit(:name, :document)
        end
    end
  end
end
