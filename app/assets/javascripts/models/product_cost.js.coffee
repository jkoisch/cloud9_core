Cloud9Core.ProductCost = DS.Model.extend
  cost:           DS.attr 'number'
  productId:      DS.belongsTo 'product'