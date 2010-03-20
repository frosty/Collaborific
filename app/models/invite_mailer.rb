class InviteMailer < ActionMailer::Base
  def invite_email(invite)
    recipients    invite.user.email
    from          "librarian@collaborific.com"
    subject       "[Collaborific] You've been invited to collaborate on a story!"
    sent_on       Time.now
    body          (:user => invite.user.login, :story => Story.find(invite.story), :url => process_invitation_url(:host => 'collaborific.com', :token => invite.token))
  end
end
