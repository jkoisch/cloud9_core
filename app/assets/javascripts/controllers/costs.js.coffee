Cloud9Core.CostsController = Ember.Controller.extend(
  sortProperties: ['activeDate:desc']

  actions:
    addCost: ->
      old_product = @controllerFor('product').model
      @transitionToRoute '/products/' + old_product.id + '/costs/new'
)