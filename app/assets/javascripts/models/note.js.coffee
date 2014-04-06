class App.Models.Note extends Backbone.Model
  validate: ->
    unless @hasTitle() or @hasContent()
      "Must provide a title or content"

  hasTitle: -> @hasAttribute('title')
  hasContent: -> @hasAttribute('content')
  hasAttribute: (attr) -> @has(attr) && @get(attr).trim() != ""

  # server sent JSON will go through parse method
  # info from client-side will undergo to_json, conversely.

  parse: (data) ->
    data.content = data.body.content
    delete data.body
    delete data.body_type
    delete data.body_id
    data