class FicsController < ApplicationController

  before_filter :find_story

  def new
    @fic = Fic.new
  end
  
  def create
    @fic = @story.fics.new(params[:fic])
    @fic.user = current_user
    if (@fic.save)
      flash[:notice] = "Your fic has been added to the story."
      redirect_to story_url(@story)
    else
      flash[:error] = "There was a problem adding your fic."
      redirect_to(@story)
    end
  end

  def show
    
  end
  
  def index
  
  end
  
private

  def find_story
    @story_id = params[:story_id]
    return(redirect_to(story_url)) unless @story_id
    @story = Story.find(@story_id)
  end
  
end