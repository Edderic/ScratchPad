class TodoItemsController < ApplicationController
  respond_to :json

  def create
    respond_with TodoItem.create(todo_item_params)
  end

  def update
    todo_item.update_attributes(todo_item_params)
    respond_with todo_item
  end

  def destroy
    respond_with todo_item.destroy
  end

  private

  def todo_list
    TodoList.find(params[:todo_list_id])
  end

  def todo_items
    todo_list.todo_items
  end

  def todo_item
    todo_items.find(params[:id])
  end

  def todo_item_params
    params.permit(:title, :complete)
  end
end
