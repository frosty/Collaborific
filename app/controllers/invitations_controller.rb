class InvitationsController < ApplicationController
  
  def create
    @user = User.find_by_login(params[:login])
    @story = Story.find(params[:story])
    
    if @user.nil?
      flash[:error] = "That user doesn't exist."
      redirect_to @story and return
    elsif Invitation.find_by_user_id_and_story_id(@user,@story)
      flash[:error] = "That user has already been invited."
      redirect_to @story and return
    end

    @invite = Invitation.new(:user => @user, :story => @story)
    
    success = current_user && @invite.save
    if success && @invite.errors.empty?
      InviteMailer.deliver_invite_email(@invite)
      # should check for success of email send.
      flash[:success] = "We've sent an invitation to #{@user.login}."
      redirect_to @story
    else
      flash[:error] = "There was an error sending the invitation. Please try again."
      redirect_to @story
    end
  end
  
  before_filter :login_required 
  
  def process_invite
    @invite = Invitation.find_by_token(params[:token])
    if @invite
      @story = Story.find_by_id(@invite.story)
      if @invite.user == current_user
        @story.collaborators.create(:user => @invite.user)
        @invite.destroy
        flash[:success] = "You're now a collaborator on this story!"
        redirect_to @story
      else
        flash[:error] = "The invitation code you've tried to use doesn't belong to you."
        redirect_to @story
      end
    else
      flash[:error] = "That invitation code has expired or doesn't exist."
      redirect_to '/'
    end
  end
  
end
