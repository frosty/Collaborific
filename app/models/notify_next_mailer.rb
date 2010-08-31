class NotifyNextMailer < ActionMailer::Base
  def notify_next_email(story)
    user = Story.next_collaborator_for(story)
    recipients    user.email
    from          "librarian@collaborific.com"
    subject       "[Collaborific] It's your turn to write a fic!"
    sent_on       Time.now
    body          :user => user.login, :story => story, :url => story_url(story)
  end
end