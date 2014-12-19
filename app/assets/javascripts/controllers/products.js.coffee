Cloud9Core.ProductsController = Ember.ArrayController.extend
  sortProperties: ['name'],
  sortAscending: true

  actions:
    addProduct: -> @transitionToRoute '/products/new'