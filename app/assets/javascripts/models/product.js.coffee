Cloud9Core.Product = DS.Model.extend
  name:           DS.attr 'string'
  description:    DS.attr 'string'
  activeCost:     DS.attr 'number'
  costs:        DS.hasMany('cost', {async:true})


  formattedCost: (->
    pc = @get('activeCost')/100
    return "$ " + pc.toFixed(2)
  ).property('activeCost')

