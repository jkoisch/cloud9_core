Cloud9Core.ProductController = Ember.ObjectController.extend(
  showUnsavedMessage: ( ->
    @get('isDirty') and !@get('isSaving')
  ).property('isDirty', 'isSaving')

  actions:
    saveChanges: -> @get('model').save()
    delete: ->
      @get('model').destroyRecord().then =>
      @transitionToRoute 'products'
)