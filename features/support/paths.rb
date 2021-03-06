module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    
    when /the signup page/
      signup_path
    
    when /the login page/
      login_path
    
    when /my user page/
      user_page_path @user.login
    
    when /the new story page/
      new_story_path
    
    when /my stories page/
      user_stories_url @user.id
      
    when /the stories page/
      stories_url
    
    when /the story page/
      story_path @story.permalink
      
    when /the new fic page/
      new_story_fic_path(@story)
      
    when /the RSS feed link/
      stories_rss_path(@story)
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
