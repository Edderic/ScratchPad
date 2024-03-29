class App.Models.StickyNote extends Backbone.Model
  validate: ->
    unless @hasTitle() or @hasContent()
      "Must provide a title or content"

  hasTitle: -> @hasAttribute('title')
  hasContent: -> @hasAttribute('content')
  hasAttribute: (attr) -> @has(attr) && @get(attr).trim() != ""

  # server sent JSON will go through parse method
  # info from client-side will undergo to_json, conversely.

  parse: (data) ->
    data.content = data.body.sticky_note?.content
    delete data.body
    data


  toJSON: ->
    {
      title: @get('title')
      body:
        type: 'sticky_note'
        sticky_note:
          content: @get('content')
    }
