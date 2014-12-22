Cloud9Core.ProductType = DS.Model.extend
  name:                       DS.attr 'string'
  description:                DS.attr 'string'
  products:                   DS.hasMany('product')