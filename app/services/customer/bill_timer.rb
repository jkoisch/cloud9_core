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

      @frequency.eql? ("Monthly") ? @days_per_period = DAYS_PER_YEAR / 12 : @days_per_period = DAYS_PER_YEAR
      @period = ((@target_date - @customer.billing_date_base) / @days_per_period).to_i


    end

    def call()
      @alarm = false

      unless @period < 1
        minutes_per_period = MINUTES_PER_DAY * @days_per_period
        minutes_since_billing_date_base = (@target_date - @customer.billing_date_base).to_i * MINUTES_PER_DAY
        @alarm = minutes_since_billing_date_base % minutes_per_period < MINUTES_IN_THRESHOLD
      end
      @alarm
    end

    def countdown
      minutes_per_period = MINUTES_PER_DAY * @days_per_period
      minutes_since_billing_date_base = (@target_date - @customer.billing_date_base).to_i * MINUTES_PER_DAY
      ((minutes_per_period - (minutes_since_billing_date_base % minutes_per_period)) / MINUTES_PER_DAY).to_f
    end
  end
end