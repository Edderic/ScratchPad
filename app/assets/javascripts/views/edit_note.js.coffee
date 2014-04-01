class App.Views.EditNote extends Backbone.View
  template: JST['notes/edit']

  tagName: 'form'  

  events:
    'submit': 'saveModel'   # bind

  render: ->
    @$el.html(@template(note: @model))
    this

  saveModel: (e) ->
    # @model.set('title', @$('.note-title').val())
    # @model.set('content', @$('.note-content').val())
    @model.set
      title: @$('.note-title').val()
      content: @$('.note-content').val()
    Backbone.history.navigate('/', trigger: true)
    false 