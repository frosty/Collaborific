Given /^I have started a story with the following data:$/ do |table|
  @story = @user.stories.create!(table.rows_hash)
end