class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end
  def index
    @todos = Todo.all()
  
  end
  def new
  
  end
  def create
    render plain: params[:todo]
  end
end