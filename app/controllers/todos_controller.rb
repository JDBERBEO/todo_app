class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end
  def index
    @todos = Todo.all()
  
  end
end