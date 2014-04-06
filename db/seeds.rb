Note.destroy_all

Note.create( title: 'The first note', body: StickyNote.create(content: 'I am a note'))
Note.create( title: 'The second note', body: StickyNote.create(content: 'True dat'))
Note.create( title: 'The third note', body: StickyNote.create(content: 'more notes'))