Cloud9Core.Invoice = DS.Model.extend
  total:          DS.attr 'number'
  sample:         DS.attr 'boolean'
  invoiceGroups:  DS.hasMany('cost', {async:true})
  customer:       DS.belongsTo('customer')
  workflowState:  DS.attr 'number'
  notes:          DS.attr 'string'
  billDate:       DS.attr 'date'

  formattedAmount: (->
    pc = @get('total')/100
    return "$ " + pc.toFixed(2)
  ).property('total')

  status: (->
    return "Staged" if(@get('workflowState')==100)
    return "Ready" if(@get('workflowState')==200)
    return "Sent" if(@get('workflowState')==300)
    return "Paid" if(@get('workflowState')==400)
    return "Errored" if(@get('workflowState')==500)
    return "Sampled" if(@get('workflowState')==700)
    return "Failed" if(@get('workflowState')==999)
    return null
  ).property('workflowState')

