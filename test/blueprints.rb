require 'machinist/active_record' 
require 'sham'
require 'faker'

Sham.name { Faker::Internet.user_name }
Sham.email { Faker::Internet.email }
    
Story.blueprint do
  title               "An ode to beans"
  description         "A story about beans."
  fic_length          100
  fic_length_enforce  false
  owner { User.make }
end

Fic.blueprint do
  content   "This is some fic content"
  story
  user
end

User.blueprint do
  login   { Sham.name }
  email   { Sham.email }
  password  "wibble"
  password_confirmation "wibble"
end