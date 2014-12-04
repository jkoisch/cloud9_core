Cloud9Core.ComponentModel = DS.Model.extend
  systemId:                     DS.attr 'number'
  productId:                    DS.attr 'number'
  active:                       DS.attr 'string'
  quantity:                     DS.attr 'number'
  createdAt:                    DS.attr 'date'