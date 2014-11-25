Cloud9Core.Price = DS.Model.extend
  amount:         DS.attr 'number'
  active:         DS.attr 'boolean'
  activeDate:     DS.attr 'date'
  product_id:     DS.attr 'number'

  isActive: (->
    return @get('active')
  ).property('active')

  formattedAmount: (->
    pc = @get('amount')/100
    return "$ " + pc.toFixed(2)
  ).property('amount')

