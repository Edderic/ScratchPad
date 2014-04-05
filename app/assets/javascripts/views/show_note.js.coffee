class App.Views.ShowNote extends Backbone.View
  template: JST['notes/show']

  className: 'note' # will make the class attr a 'note'

  events:
    'change': 'save'
    'keydown .note-title': 'saveIfEnter'
    'focus .note-title, .note-content': 'beginEditing'
    'blur .note-title, .note-content': 'endEditing'
    'click .destroy-note': 'destroyNote'

  render: ->
    @$el.html(@template(note: @model))
    this

  save: ->
    @model.set
      title: @$('.note-title').val()
      content: @$('.note-content').val()
    @model.save()
    false

  saveIfEnter: (e) ->
    if e.keyCode == 13
      @$(':input').blur()

  beginEditing: ->
    @$el.addClass('editing')

  endEditing: ->
    @$el.removeClass('editing')

  destroyNote: ->
    @model.destroy()
    @remove()
    false