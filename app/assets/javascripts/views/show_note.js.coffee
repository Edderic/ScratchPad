class App.Views.ShowNote extends Backbone.View
  template: JST['notes/show']

  className: 'note' # will make the class attr a 'note'

  initialize: ->
    @listenTo(@model, "invalid", @addError)
    @listenTo(@model, "error", @addError)
    @lastUpdated = new App.Views.LastUpdated(model: @model)
    # @noteBody = new App.Views.StickyNote(model: @model)
    @noteBody = App.viewFor(@model)


  events:
    'change': 'save'
    'keydown .note-title': 'saveIfEnter'
    'focus .note-title, .note-content': 'beginEditing'
    'blur .note-title, .note-content': 'endEditing'
    'click .destroy-note': 'destroyNote'

  render: ->
    @$el.html(@template(note: @model))
    @lastUpdated.setElement(@$('.normal-footer')).render()   
    @noteBody.setElement(@$('.body')).render()
    this

  remove: ->
    @lastUpdated.remove(arguments...)   # needed to prevent memory leaks 
    @noteBody.remove(arguments...)
    super(arguments...)

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
    @$el.removeClass('error')

  endEditing: ->
    @$el.removeClass('editing')

  destroyNote: ->
    @model.destroy()
    @remove()
    false

  addError: =>
    @$el.addClass("error")