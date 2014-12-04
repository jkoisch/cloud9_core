Cloud9Core.CustomerModel = DS.Model.extend
  firstName:                     DS.attr 'string'
  lastName:                      DS.attr 'string'
  organizationName:              DS.attr 'string'
  role:                          DS.attr 'string'
  email:                         DS.attr 'string'

  fullName: (->
    return @get('firstName') + ' ' + @get('lastName')
  ).property('firstName', 'lastName')

  fullFormalName: (->
    return @get('fullName') + ' ( ' +  @get('email') + ' )'
  ).property('email')

