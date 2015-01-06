Cloud9Core.CustomerModel = DS.Model.extend
  organizationName:              DS.attr 'string'
  contacts:                      DS.hasMany('contact', {async:true})
  components:                    DS.hasMany('component', {async:true})
  systems:                       DS.hasMany('system', {async:true})
  invoices:                      DS.hasMany('invoice', {async:true})

