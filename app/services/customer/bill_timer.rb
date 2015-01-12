module Customer
  class BillTimer

    DAYS_PER_YEAR = 365.25
    MINUTES_PER_DAY = 1440
    MINUTES_IN_THRESHOLD = 800

    def self.build(customer, target_date)
      new(customer, target_date)
    end

    def initialize(customer, target_date)
      @customer = customer
      @target_date = target_date
      @customer.billing_frequency.present? ? @frequency = @customer.billing_frequency : @frequency = "Annual"
      @days_per_period = (@frequency.eql?("Monthly") ? DAYS_PER_YEAR / 12 : DAYS_PER_YEAR)
      @period = ((@target_date - @customer.billing_date_base) / @days_per_period).to_i
    end

    def call()
      @alarm = false

      unless @period < 1
        @alarm = minutes_since_billing_date_base % periodicity < MINUTES_IN_THRESHOLD
      end
      @alarm
    end

    def countdown
      ((periodicity - (minutes_since_billing_date_base % periodicity)) / MINUTES_PER_DAY).to_f
    end

    def periodicity
      MINUTES_PER_DAY * @days_per_period
    end

    def minutes_since_billing_date_base
      (@target_date - @customer.billing_date_base).to_i * MINUTES_PER_DAY
    end
  end
end