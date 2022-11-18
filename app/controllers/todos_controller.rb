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
      flash[:notice] = "Article was created successfully."
      redirect_to @todo
    else 
      render 'new'
    end
  end
end