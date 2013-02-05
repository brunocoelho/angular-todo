class TodosController < ApplicationController
  respond_to :json
  before_filter :find_todo, except: [:index, :create, :edit]

  def index
    @todos = Todo.all
    respond_with @todos
  end

  def show
    respond_with @todo
  end

  def create
    @todo = Todo.create(params[:todo])
    created = @todo ? 'true' : 'false'
    render json: { created: created }
  end

  def edit
    @todo.update_attributes(params[:todo])
    respond_with @todo
  end

  def destroy
    @todo.destroy
    render json: { deleted: 'true' }
  end

  private
  def find_todo
    @todo = Todo.find(params[:id])
  end
end
