class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, touch: true

  validates :title, presence: true
end
