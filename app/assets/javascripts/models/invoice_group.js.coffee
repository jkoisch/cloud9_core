Cloud9Core.InvoiceGroup = DS.Model.extend
  total:          DS.attr 'number'
  name:           DS.attr 'string'
  description:    DS.attr 'string'
  invoiceLines:   DS.hasMany('invoiceLine', {async:true})

