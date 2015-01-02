module Component
  class Validating

    def self.build
      new
    end

    def initialize
    end

    def call(system_id, customer_id, sys)
      @system_id = system_id
      @customer_id = customer_id
      unless @customer_id.nil?
        sys.keys.each do |k|
          puts k
          prod_id = Cloud9::Product.match_component(k)
          check_component(prod_id, sys[k], @system_id, @customer_id) unless prod_id.nil?
        end
      end
    end

    def check_component(prod_id, qty, system_id, customer_id)
      comp = Cloud9::Component.find_or_initialize_by(system_id: system_id, product_id: prod_id, active: true, customer_id: customer_id)
      if comp.new_record?
        comp.quantity = qty
      else
        if comp.quantity != qty
          comp.active = false
          comp.save
          comp = Cloud9::Component.find_or_initialize_by(system_id: system_id, product_id: prod_id, active: true, customer_id: customer_id, quantity: qty)
        end
      end
      comp.save!
    end
  end
end