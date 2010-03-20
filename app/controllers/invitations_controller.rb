class InvitationsController < ApplicationController
  
  def create
    @user = User.find_by_login(params[:login])
    @story = Story.find(params[:story])
    @invite = Invitation.new(:user => @user, :story => @story)
    
    success = @invite && @invite.save
    if success && @invite.errors.empty?
      render :text => "Inviting #{@user.login}, via #{@user.email}, with token: #{@invite.token}"
    else
      render :text => "Error"
    end
  end
  
  before_filter :login_required 
  
  def process_invite
    @invite = Invitation.find_by_token(params[:token])
    @story = Story.find_by_id(@invite.story)
    if @invite.user == current_user
      @story.collaborators.create(:user => @invite.user)
      @invite.destroy
      flash[:notice] = "You're now a collaborator on this story!"
      redirect_to @story
    else
      flash[:error] = "The invitation code you've tried to use doesn't belong to you."
      redirect_to @story
    end
  end
  
end
