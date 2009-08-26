# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ibmyp_session',
  :secret      => '3020537be4f2be0d8456c316c45160a3768667f48cb308c1eb10c6e944c268b4e262e424c0cb7ae5734d9d299260e6b6c3bd3f8c1e479c195909e27a9e0e1bba'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
