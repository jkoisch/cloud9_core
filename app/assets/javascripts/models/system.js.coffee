Cloud9Core.System = DS.Model.extend
  virtualMachineIdentifier:                       DS.attr 'string'
  customerId:                                     DS.attr 'number'
  updatedAt:                                      DS.attr 'date'
  measurements:                                   DS.hasMany('measurement', {async:true})
  components:                                     DS.hasMany('component', {async:true})