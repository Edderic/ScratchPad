Note.destroy_all

# StickyNote.create(content: "Don't forget to make a todo list", note: Note.create(title: 'A simple note') )

# TodoList.new(
#   todo_items: [
#     TodoItem.new(title: "Make a second todo", complete: true),
#     TodoItem.new(title: "Make a third todo", complete: false),
#     TodoItem.new(title: "DISCO PARTY!", complete: false)
#   ],
#   body: Note.create(title: "A more complex todo list")
# )

Note.create([
  {
    title: "A simple note",
    body: StickyNote.new(content: "Don't forget to make a todo list")
  },
  {
    title: "A more complex todo list",
    body: TodoList.new(
      todo_items: [
        TodoItem.new(title: "Make a second todo item", complete: true),
        TodoItem.new(title: "Make another todo list", complete: false),
        TodoItem.new(title: "DISCO PARTY!", complete: false)
      ]
    )
  }
])
