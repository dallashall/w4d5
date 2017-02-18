class SubsController < ApplicationController
  before_action :logged_in?, only: [:create, :update, :edit, :destroy]

  def create
    @sub = Sub.new(sub_params)
    if @sub.save!
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def index
    @subs = Sub.all
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub
      @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = ["Invalid sub"]
      render :edit
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
  end

  def new
    @sub = Sub.new
  end

  def destroy
    @sub = Sub.find_by(id: params[:id])
    if @sub
      @sub.destroy
    else
      flash[:errors] = ["Could not find sub"]
      redirect_to subs_url
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
