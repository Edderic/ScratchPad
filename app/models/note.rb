class Note < ActiveRecord::Base
  belongs_to :body, polymorphic: true

end
