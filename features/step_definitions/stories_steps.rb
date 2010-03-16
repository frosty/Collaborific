Given /^I have started a story with the following data:$/ do |table|
  @story = @user.stories.new(table.rows_hash)
  @story.owner = @user
  @story.save
end

Given /^there are stories in existence$/ do
  @story = Story.create!({
                  :title => "Ode to beans",
                  :description => "A testament to the musical fruit",
                  :fic_length => 200,
                  :fic_length_enforce => :true,
                  :owner => @user
  })
  @story.save
  @story.fics.create!({
    :content => "And so it came to pass that the dancing festival of the musical fruit did burst forth one Summer's day with rapture and joy."
  })
end

Given /^there are no stories in existence$/ do
  @story.destroy
end

Then /^I should see all of the stories$/ do
  @stories = Story.find(:all)
  if response.to_s.find(@stories)
    assert true
  else
    assert false
  end
end

Then /^I should see all of this story's fics$/ do
  @fics = @story.fics.find(:all)
  if response.to_s.find(@fics)
    assert true
  else
    assert false
  end
end

Given /^I fill in the form with valid story data$/ do
  And %Q{I fill in "Title" with "The tale of the flopsy bunny"}
  And %Q{I fill in "Description" with "A story about a cute little bunny rabbit."}
  And %Q{I fill in "Length of each story section" with "Catfood"}
  And %Q{I check "Prevent contributors from going over this limit?"}
end