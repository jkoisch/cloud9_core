Cloud9Core.ContactModel = DS.Model.extend
  name:                         DS.attr 'string'
  email:                        DS.attr 'string'
  role:                         DS.attr 'string'
  cloud9_customer_id:           DS.attr 'number'



  customerContact: (->
    return @get('name') + ' (' + @get('email') + ')'
  ).property('name', 'email')