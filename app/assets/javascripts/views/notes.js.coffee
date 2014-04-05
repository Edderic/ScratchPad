class App.Views.Notes extends Backbone.View
  # template: _.template "<div>Hello, <%= name %></div>"
  template: JST['notes/index'] 
 
  render: ->
    # @$('.jquery-selector') same as @$el.find('.jquery-selector') 
    #@$el same as $(@.el) or $(this.el)
 
    @$el.html(@template())
    @collection.forEach(@renderNote) # forEach is coming from underscore  
    this  

  renderNote: (note) =>
    view = new App.Views.ShowNote(model: note, tagName: 'li')
    @$('.notes').append(view.render().el)

