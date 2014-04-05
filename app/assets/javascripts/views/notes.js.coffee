class App.Views.Notes extends Backbone.View
  # template: _.template "<div>Hello, <%= name %></div>"
  template: JST['notes/index'] 
 
  initialize: -> # called after backbone loads
    @addActions = new App.Views.AddActions(collection: @collection)
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @renderNote)

  render: =>
    # @$('.jquery-selector') same as @$el.find('.jquery-selector') 
    #@$el same as $(@.el) or $(this.el)
 
    @$el.html(@template())
    @collection.forEach(@renderNote) # forEach is coming from underscore  
    @$el.append(@addActions.render().el)
    this  

  renderNote: (note) =>
    view = new App.Views.ShowNote(model: note, tagName: 'li')
    @$('.notes').append(view.render().el)

