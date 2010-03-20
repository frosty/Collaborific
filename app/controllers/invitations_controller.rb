class InvitationsController < ApplicationController
  
  def create
    @user = User.find_by_login(params[:login])
    @story = Story.find(params[:story])
    @invite = Invitation.create(:user => @user, :story => @story)

    render :text => "Inviting #{@user.login}, via #{@user.email}, with token: #{@invite.token}"
  end
  
end
