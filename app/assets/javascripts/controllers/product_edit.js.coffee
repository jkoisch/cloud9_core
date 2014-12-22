Cloud9Core.ProductEditController = Ember.ObjectController.extend(
  needs: "productTypes"
  types: null
#  selectedOption: null
  showUnsavedEditMessage: ( ->
    @get('isDirty') and !@get('isSaving')
    ).property('isDirty', 'isSaving')
#  updateProd: (->
#    @set('productTypeId', @get('selectedOption').id)
#  ).property('selectedOption')

  actions:
    saveProduct: (->
#      @get('updateProd')
      @get('model').save()
    )

)