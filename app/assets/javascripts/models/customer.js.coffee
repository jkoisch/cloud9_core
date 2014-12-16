Cloud9Core.CustomerModel = DS.Model.extend
  organizationName:              DS.attr 'string'
  contacts:                      DS.hasMany('contact', {async:true})

