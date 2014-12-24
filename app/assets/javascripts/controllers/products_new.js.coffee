Cloud9Core.ProductsNewController = Ember.Controller.extend
  types: null
  selectedType: null

  actions:

    createProduct: ->
      console.log @get('fields')
      product = @store.createRecord 'product', @get('fields')
      product.save().then =>
        @transitionToRoute 'product', product