Given /^I have started a story with the following data:$/ do |table|
  @story = @user.stories.create!(table.rows_hash)
end

Given /^there are stories in existence$/ do
  @story = Story.create!({
                  :title => "Ode to beans",
                  :description => "A testement to the musical fruit"
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