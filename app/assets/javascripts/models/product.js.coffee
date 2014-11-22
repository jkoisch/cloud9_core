Cloud9Core.Product = DS.Model.extend
  name:           DS.attr 'string'
  description:    DS.attr 'string'
  activeCost:     DS.attr 'number'
  costs:          DS.hasMany('cost', {async:true})
  status:         DS.attr 'string'
  notes:          DS.attr 'string'


  formattedCost: (->
    pc = @get('activeCost')/100
    return "$ " + pc.toFixed(2)
  ).property('activeCost')



Cloud9Core.Product.reopenClass
  STATUSES: ['new', 'staged', 'closed', 'bad']

