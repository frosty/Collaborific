# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_collaborific_session',
  :secret      => 'a220d71a40eff50ddf6f55bfe66b7d1fb43e48064de30da3b392daaf690cb7970141b19c2753d7a13b28145d92044adc1178dcac6044577a170bd65587abc058'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
