Cloud9Core.MeasurementModel = DS.Model.extend
  systemId:                    DS.attr 'number'
  ram:                          DS.attr 'number'
  cpu:                          DS.attr 'number'
  hardDriveSpace:               DS.attr 'number'
  createdAt:                    DS.attr 'date'
