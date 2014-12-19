Cloud9Core.Product = DS.Model.extend
  name:                       DS.attr 'string'
  description:                DS.attr 'string'
  activeCost:                 DS.attr 'number'
  costs:                      DS.hasMany('cost', {async:true})
  prices:                     DS.hasMany('price', {async:true})
  status:                     DS.attr 'string'
  notes:                      DS.attr 'string'
  active:                     DS.attr 'boolean'
  activePrice:                DS.attr 'number'
  invoiceName:                DS.attr 'string'
  invoiceDescription:         DS.attr 'string'


  formattedCost: (->
    pc = @get('activeCost')/100
    return "$ " + pc.toFixed(2)
  ).property('activeCost')

  formattedPrice: (->
    pc = @get('activePrice')/100
    return "$ " + pc.toFixed(2)
  ).property('activePrice')

Cloud9Core.Product.reopenClass
  STATUSES: ['new', 'staged', 'closed', 'bad']

