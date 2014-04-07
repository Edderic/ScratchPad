class App.Views.TodoItem extends Backbone.View
  template: JST['todo_items/show']

  className: 'todo-item'

  events:
    'change .todo-item-title, .todo-item-complete': 'saveModel'

  initialize: ->
    @listenTo(@model, 'save', @render)

  render: =>
    @$el.html(@template(todoItem: @model))
    @renderComplete()
    this

  saveModel: ->
    @model.set
      title: @$(".todo-item-title").val()
      complete: @$('.todo-item-complete').is(':checked')
    if @model.hasTitle()
      @model.save()
    else
      @model.destroy()
      @remove()
    false

  renderComplete: ->
    @$('.todo-item-title').attr('disabled', @model.get('complete'))
    @$('.todo-item-complete')
      .attr('checked', @model.get('complete'))
      .attr('disabled', @model.isNew())