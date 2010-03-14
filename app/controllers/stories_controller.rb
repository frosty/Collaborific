class StoriesController < ApplicationController

  def new

  end
  
  def create
    @story = Story.new(params[:story])
    @story.owner = current_user
    
    if @story.save
      flash[:notice] = "You've started your story! Now it's time to add the first fic."
      redirect_to(@story)
    else
      flash[:error] = "There was a problem starting your story."
      render :action => 'new'
    end
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
end