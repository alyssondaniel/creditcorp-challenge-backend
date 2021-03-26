module Api
  module V1
    class ReceivablesController < ApplicationController
      before_action :set_receivable, only: [:show, :update, :destroy]

      # GET /receivables
      def index
        @api_v1_receivables = Receivable.all
        if params[:company_id].present?
          @api_v1_receivables = @api_v1_receivables.where(company_id: params[:company_id])
        end

        set_json

        render json: @api_v1_receivable_json
      end

      # GET /receivables/1
      def show
        render json: @api_v1_receivable_json
      end

      # POST /receivables
      def create
        @api_v1_receivable = Receivable.new(receivable_params)
        if @api_v1_receivable.save
          set_json
          render json: @api_v1_receivable_json, status: :created, location: @api_v1_receivable_url
        else
          render json: @api_v1_receivable.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /receivables/1
      def update
        if @api_v1_receivable.update(receivable_params)
          set_json
          render json: @api_v1_receivable_json
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
          set_json
        end

        # Only allow a list of trusted parameters through.
        def receivable_params
          params.require(:receivable).permit(:net_value, :expired_at, :key, :company_id)
        end

        def set_json
          data = @api_v1_receivable || @api_v1_receivables
          @api_v1_receivable_json = ReceivableSerializer.new(
            data,
            { params: { tax: params['tax'].to_f } }
          ).to_h
        end
    end
  end
end
