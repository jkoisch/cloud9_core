Cloud9Core.Product = DS.Model.extend
  name:           DS.attr 'string'
  description:    DS.attr 'string'
  productCostIds: DS.hasMany 'productCost'