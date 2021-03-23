module Api
  module V1
    class ReceivablesController < ApplicationController
      before_action :set_receivable, only: [:show, :update, :destroy]

      # GET /receivables
      def index
        @api_v1_receivables = Receivable.all

        render json: @api_v1_receivables
      end

      # GET /receivables/1
      def show
        render json: @api_v1_receivable
      end

      # POST /receivables
      def create
        @api_v1_receivable = Receivable.new(receivable_params)

        if @api_v1_receivable.save
          render json: @api_v1_receivable, status: :created, location: @api_v1_receivable_url
        else
          render json: @api_v1_receivable.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /receivables/1
      def update
        if @api_v1_receivable.update(receivable_params)
          render json: @api_v1_receivable
        else
          render json: @api_v1_receivable.errors, status: :unprocessable_entity
        end
      end

      # DELETE /receivables/1
      def destroy
        @api_v1_receivable.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_receivable
          @api_v1_receivable = Receivable.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def receivable_params
          params.require(:receivable).permit(:net_value, :expired_at, :key, :company_id)
        end
    end
  end
end
