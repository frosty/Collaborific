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
                  :fic_length_enforce => true,
                  :owner => @user
  })
  @story.save
  @story.fics.create!({
    :content => "And so it came to pass that the dancing festival of the musical fruit did burst forth one Summer's day with rapture and joy.",
    :user => @user})
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

When /^I fill in 250 words of lorem ipsum for "([^\"]*)"$/ do |arg1|
  fill_in arg1, :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dictum sem arcu, in fringilla lorem. Vivamus consectetur interdum libero, sit amet vehicula nunc auctor id. Aenean in purus eu est mollis dictum. Sed feugiat, diam ut bibendum pretium, ipsum sem pellentesque orci, ac tincidunt mauris quam id nulla. Morbi interdum tortor velit, in ultrices libero. Aenean luctus diam et purus vehicula at fringilla arcu tincidunt. Integer quis diam sit amet neque vehicula accumsan. Nunc a nibh vel augue fringilla porta sed a odio. Donec a ligula lobortis urna porta pretium. Nunc sollicitudin condimentum urna, et gravida leo semper sit amet. Donec auctor tincidunt imperdiet. Etiam sit amet nibh tortor, at bibendum tortor. Morbi nec erat nulla, eget blandit tellus. Sed purus tellus, porta in pharetra non, faucibus ut dui. Ut mollis, magna vitae iaculis pulvinar, arcu magna ultrices quam, quis tincidunt lorem eros et lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur et dolor justo. In elementum, erat sit amet consectetur feugiat, diam orci egestas erat, vel consectetur odio justo ultricies metus. Nunc ornare posuere sodales. Suspendisse fringilla augue quis sem varius adipiscing.  In fringilla venenatis sollicitudin. In fermentum, urna sit amet imperdiet viverra, nibh magna tristique felis, id hendrerit libero libero eleifend lorem. Curabitur dapibus libero pulvinar leo pulvinar dignissim. Vivamus quis volutpat sapien. Ut nisi nisi, venenatis ut consectetur ut, sollicitudin vel purus. Donec id dui a arcu lacinia ornare. Proin hendrerit tempor ornare. Aenean consequat mattis lacus, ac cursus nibh semper."
end