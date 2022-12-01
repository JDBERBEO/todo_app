class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end
  def index
    @todos = Todo.all()
  
  end
  def new
    @todo = Todo.new
  end
  def create
    @todo = Todo.new(params.require(:todo).permit(:title, :description))
    if @todo.save
      flash[:notice] = "Todo was created successfully."
      redirect_to @todo
    else 
      render 'new'
    end
  end
  def edit
    @todo = Todo.find(params[:id])
  end
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(params.require(:todo).permit(:title, :description))
      flash[:notice] = "Todo was updated succesfully"
      redirect_to @todo
    else
      render 'edit'
    end
  end
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end
end