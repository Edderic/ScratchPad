class App.Views.Notes extends Backbone.View
  # template: _.template "<div>Hello, <%= name %></div>"
  template: JST['notes/index'] 
 
  events:
    'click a': 'showNote'

  render: ->
    # @$('.jquery-selector') same as @$el.find('.jquery-selector') 
    #@$el same as $(@.el) or $(this.el)
 
    @$el.html(@template(notes: @collection))
    this  

  # value of 'this' is still going to be the instance of our view.
  showNote: (e) ->
    $this = $(e.currentTarget)  # gets the current target.
    url = $this.attr("href")
    Backbone.history.navigate(url, trigger: true)  # make the link asynchronous
                                    # DOESN'T trigger routing by default! -_-  
    false                           # same effect as e.preventDefault()
