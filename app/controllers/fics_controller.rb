class FicsController < ApplicationController

  def new
      
  end
  
  def create
    @fic = Fic.create(params[:fic])
    flash[:notice] = params[:story]
    @fic.story = params[:story]
    if @fic.save
      redirect_to(@fic)
    else
      flash[:error] = "There was a problem adding your fic."
      render :action => 'new'
    end
  end
  
  def show
    
  end
  
  def index
  
  end
  
end