module System
  class Measuring

    def self.build
      new
    end

    def initialize()
    end

    def call(system, measurement)
      @system = system
      @system.measurements << Cloud9::Measurement.new(
          system_id: @system.id,
          raw_metric_data: measurement.to_s,
          ram: measurement[:ram],
          cpu: measurement[:cpu],
          total_hd_space: measurement[:total_hd_space],
          free_hd_space: measurement[:free_hd_space],
          average_ram_utilization: measurement[:average_ram_utilization],
          total_users: measurement[:total_users],
          pagefile_size: measurement[:pagefile_size],
          dataserver: measurement[:dataserver],
          datastore_location: measurement[:datastore_location],
          pagefile_location: measurement[:pagefile_location]
      )
      @system.id if @system.save
    end

  end
end