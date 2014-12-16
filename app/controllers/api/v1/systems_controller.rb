module Api
  module V1
    class SystemsController < ApplicationController
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
        updated_systems = []
        customer = check_customer(system_params)
        params[:system][:measurements].each { |sys| updated_systems << build_system(sys, customer.id) }

        render json: updated_systems
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

      def build_system(sys, customer_id)
        system = Cloud9::System.find_or_create_by(
          virtual_machine_identifier: sys[:virtual_machine_identifier],
          customer_id: customer_id
        )
        system.update_measurement(sys) ? system.id : nil
      end

      def check_customer(sys)
        Cloud9::Customer.retrieve_by_cloud9_id(sys[:cloud9_id])
      end

    end
  end
end
