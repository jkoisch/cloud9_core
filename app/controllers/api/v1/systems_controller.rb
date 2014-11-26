module Api
  module V1
    class SystemsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        render json: Cloud9::System.all
      end

      def show
        render json: system
      end

      def create
        respond_with :api, :v1, Cloud9::System.create(product_params)
      end

      def update
        respond_with system.update(product_params)
      end

      def measurement
        updated_systems = []

        p params

        params[:measurements].each do |sys|
          updated_systems << system(sys)
        end
        render json: updated_systems
      end

      private

      def system_params
        #  virtual_machine_identifier :string(255)
        #  raw_data                   :text
        #  customer_id                :integer
        params.require(:system).permit(
            :virtual_machine_identifier,
            :notes,
            :customer_id,
            :ram,
            :cpu,
            :hd_space,
            :users,
            :measurements_attributes  => [:virtual_machine_identifier,
                                          :customer,
                                          :notes,
                                          :ram,
                                          :cpu,
                                          :hd_space,
                                          :users]
        )
      end

      def system(sys)
        system = Cloud9::System.find_or_create_by(
          virtual_machine_identifier: sys[:virtual_machine_identifier],
          customer_id: sys[:customer_id]
        )

        system.update_measurement(sys)
      end

    end
  end
end
