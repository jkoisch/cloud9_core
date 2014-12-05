class UpdateMeasurementAndSystemFields < ActiveRecord::Migration

  # CPU (total logical processors)
  # Total Physical RAM (currently reports in bytes)
  # Average RAM utilization (I currently generate a 4 hour average of
  # RAM usage which gathers its measurements every 5 minutes)
  # Total HDD space (C: and D: separately, in bytes)
  # Free HDD space (on C and D)
  # User Count
  # Datastore location (unc path)
  # Pagefile Location (unc path)
  # Pagefile Size (in bytes)
  # DataServer (boolean)

  #  ram                      :integer
  #  cpu                      :integer
  #  hard_drive_space         :integer
  #  per_user_ram_utilization :integer
  def change

    remove_column :measurements, :per_user_ram_utilization
    add_column :measurements, :average_ram_utilization, :decimal, precision: 5, scale: 2

    remove_column :measurements, :hard_drive_space
    add_column :measurements, :total_hd_space, :bigint
    add_column :measurements, :free_hd_space, :bigint
    add_column :measurements, :total_users, :integer
    add_column :measurements, :pagefile_size, :bigint
    add_column :measurements, :dataserver, :boolean

    add_column :measurements, :datastore_location, :string
    add_column :measurements, :pagefile_location, :string

  end
end
