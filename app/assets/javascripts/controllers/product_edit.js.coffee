Cloud9Core.ProductEditController = Ember.ObjectController.extend(
  needs: "productTypes"
  types: null
  showUnsavedEditMessage: ( ->
    @get('isDirty') and !@get('isSaving')
    ).property('isDirty', 'isSaving')

  actions:
    saveProduct: (->
      @get('model').save()
    )

)