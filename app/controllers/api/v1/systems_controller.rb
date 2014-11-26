module Api
  module V1
    class SystemsController < ApplicationController

      def index
        render json: Cloud9::System.all
      end

      def create

      end

      def auto_update

      end

      private

      def system_params
        #  virtual_machine_identifier :string(255)
        #  raw_data                   :text
        #  customer_id                :integer
        params.require(:system).permit(:virtual_machine_identifier, :notes, :customer_id, :ram, :cpu, :hd_space, :users)
      end

      def system
        system = Cloud9::System.find_or_initialize_by(
          virtual_machine_identifier: params[:system][:virtual_machine_identifier],
          customer_id: params[:system][:customer_id]
        )

        if system.new_record?
          system.save
        else
          system.components.each do |c|
            c.active = false
          end
        end

        c_ram = Cloud9::Component.create(
          system_id: system.id,
          active: true,
          product_id: Product.ram_id
        )

        c_cpu = Cloud9::Component.create(
            system_id: system.id,
            active: true,
            product_id: Product.cpu_id
        )

        c_hd = Cloud9::Component.create(
            system_id: system.id,
            active: true,
            product_id: Product.hd_id
        )



      end

    end
  end
end
