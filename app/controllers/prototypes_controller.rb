class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
   
  def index
    @prototypes = Prototype.all
  end  

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
       redirect_to root_path(@prototype)
    else   
       render :new
    end   
  end  

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    unless user_signed_in? && current_user == @prototype.user
      redirect_to root_path
    end  
  end
  
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to @prototype
    else
      render :edit 
    end   
  end  


  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
  end  
   
  private
  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept, :text).merge(user_id: current_user.id)
  end
 
 def set_prototype
   @prototype = Prototype.find(params[:id])
 end 
end

