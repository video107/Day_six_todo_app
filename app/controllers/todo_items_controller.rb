class TodoItemsController < ApplicationController
  before_action :set_todo_list


  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to @todo_list
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:alert] = "Done"
    else
      flash[:error] = "Todo list no done"
    end
    redirect_to @todo_list
  end



private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:content)
  end
end
