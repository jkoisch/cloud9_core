Cloud9Core.ProductsController = Ember.ArrayController.extend
  sortProperties: ['productTypeId'],
  sortAscending: true

  actions:
    addProduct: -> @transitionToRoute '/products/new'