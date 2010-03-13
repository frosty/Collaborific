Given /^a valid user$/ do
  @user = User.create!({
                  :login => "McTestFace",
                  :email => "testy@testface.com",
                  :password => "wibble",
                  :password_confirmation => "wibble"
  })
end