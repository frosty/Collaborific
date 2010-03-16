Given /^a valid user$/ do
  @user = User.create!({
                  :login => "mctestface",
                  :email => "testy@testface.com",
                  :password => "wibble",
                  :password_confirmation => "wibble"
  })
end

Given /^a logged in user$/ do
  Given "a valid user"
  When "I am on the login page"
  And %Q{I fill in "Login" with "McTestFace"}
  And %Q{I fill in "Password" with "wibble"}
  And %Q{I press "Log in"}
end