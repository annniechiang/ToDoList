class TodolistsController < ApplicationController
  before_action :set_todolist, :only => [:show, :edit, :update, :destroy]

  def index
    @todolists = Todolist.all
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(task_params)
    if @todolist.save
      redirect_to todolists_path
    else
      render :new
    end
  end

  def show   
  end

  def edit 
  end

  def update   
    if @todolist.update_attributes(task_params)
      redirect_to todolist_path(@todolist)
    else
      render :edit
    end
  end

  def destroy
    @todolist.delete

    redirect_to todolists_url
  end

  private

  def set_todolist
    @todolist = Todolist.find(params[:id])
  end

  def task_params
    params.require(:todolist).permit(:task, :due_date, :note)
  end
end
