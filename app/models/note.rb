class Note < ActiveRecord::Base
  belongs_to :body, polymorphic: true, autosave: true, inverse_of: :note, dependent: :destroy

end
