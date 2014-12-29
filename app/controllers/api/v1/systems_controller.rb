module Api
  module V1
    class SystemsController < ApplicationController
      include Component
      include System

      skip_before_action :verify_authenticity_token

      def index
        render json: Cloud9::System.all
      end

      def show
        _id = params[:id]
        render json: system(_id)
      end

      def create
        respond_with :api, :v1, Cloud9::System.create(system_params)
      end

      def update
        respond_with system.update(product_params)
      end

      def measurement
        measured_systems = []
        customer = check_customer(system_params)
        @validator = Component::Validating.new
        @yardstick = System::Measuring.new
        params[:system][:measurements].each do |sys|
          system = check_system(sys, customer.id)
          @validator.call(system.id, customer.id, sys)
          measured_systems << @yardstick.call(system,sys)
        end
        render json: measured_systems
      end

      private

      def system_params
        #  virtual_machine_identifier :string(255)
        #  raw_data                   :text
        #  customer_id                :integer
        params.require(:system).permit(
            :id,
            :customer_id,
            :cloud9_id,
            :notes,
            :measurements_attributes  => [:virtual_machine_identifier,
                                          :customer,
                                          :notes,
                                          :ram,
                                          :cpu,
                                          :hd_space,
                                          :users])
      end

      def system(_id)
        Cloud9::System.find(_id)
      end

      def check_customer(sys)
        Cloud9::Customer.retrieve_by_cloud9_id(sys[:cloud9_id])
      end

      def check_system(sys, customer_id)
        Cloud9::System.retrieve_by_vm_id(sys[:virtual_machine_identifier], customer_id)
      end


    end
  end
end
