class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :system_id, :ram, :cpu, :created_at, :average_ram_utilization, :total_hd_space, :free_hd_space, :total_users, :pagefile_size, :dataserver, :datastore_location, :pagefile_location
end