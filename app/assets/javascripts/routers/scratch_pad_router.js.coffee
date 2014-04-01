# App.Routers.ScratchPadRouter = Backbone.Router.extend
class App.Routers.ScratchPadRouter extends Backbone.Router
  routes:
    '': 'index'
    'notes/:id': 'showNote'

  index: ->
    view = new App.Views.Notes(collection: App.AllNotes)  # Called in notes.js.coffee, init at scratch_pad.js.coffee
    $('#container').html(view.render().el)  # what is el again?

  showNote: (id) ->
    model = App.AllNotes[id - 1]
    view = new App.Views.EditNote model: model
    $('#container').html(view.render().el)

