Cloud9Core.ProductsNewController = Ember.Controller.extend


  actions:

    createProduct: ->
      product = @store.createRecord 'product', @get('fields')
      product.save().then =>
        @transitionToRoute 'product', product