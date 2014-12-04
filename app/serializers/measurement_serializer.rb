class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :system_id, :ram, :cpu, :hard_drive_space, :created_at
end