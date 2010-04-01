class FicsController < ApplicationController

  before_filter :find_story

  def new
    @fic = Fic.new
  end
  
  def create
    @fic = @story.fics.new(params[:fic])
    @fic.user = current_user
    if @story.fic_length_enforce && @fic.content.split(" ").size >
                                                              @story.fic_length
      flash[:error] = "Your fic was too long for this story. Fics for this story must be shorter than #{@story.fic_length} words."
      render :action => 'new'
    elsif (@fic.save && current_user)
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