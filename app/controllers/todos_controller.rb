class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def show
  end
  def index
    @todos = Todo.all()
  
  end
  def new
    @todo = Todo.new
  end
  def create
    @todo = Todo.new(set_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully."
      redirect_to @todo
    else 
      render 'new'
    end
  end
  def edit
  end
  def update
    if @todo.update(set_params)
      flash[:notice] = "Todo was updated succesfully"
      redirect_to @todo
    else
      render 'edit'
    end
  end
  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_params
    params.require(:todo).permit(:title, :description)
  end
end