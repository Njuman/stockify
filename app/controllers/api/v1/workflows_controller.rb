module Api
  module V1
    class WorkflowsController < ApplicationController
      before_action :authenticate_request!

      def show
        workflow = WorkflowEngine.find params['id']
        render json: workflow, status: :ok
      end

      def create
        WithdrawalWorkflow.new(metadata: workflow_params)
      end

      private

      def workflow_params
        params.require(:metadata)
      end
    end
  end
end