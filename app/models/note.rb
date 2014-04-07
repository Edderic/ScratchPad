class Note < ActiveRecord::Base
  belongs_to :body, polymorphic: true, autosave: true, dependent: :destroy   #, inverse_of:

end
