Cloud9Core.ComponentModel = DS.Model.extend
  active:                       DS.attr 'boolean'
  quantity:                     DS.attr 'number'
  createdAt:                    DS.attr 'date'
  system:                       DS.belongsTo('system')
  product:                      DS.belongsTo('product')
  customer:                     DS.belongsTo('customer')

  lineItem: (->
    return @get('quantity') + ' ' + @get('product.invoiceName')
  ).property('quantity','product')

  isActive: (->
    @get('active')
  ).property('active')