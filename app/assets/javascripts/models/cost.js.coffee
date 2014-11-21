Cloud9Core.Cost = DS.Model.extend
  amount:         DS.attr 'number'
  active:         DS.attr 'boolean'
  activeDate:     DS.attr 'date'


  formattedCost: (->
    pc = @get('amount')/100
    return "$ " + pc.toFixed(2)
  ).property('amount')

