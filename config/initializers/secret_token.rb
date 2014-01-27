# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Edits by me
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exists?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file.
		token = Securerandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = '76d0aaaba55bd40812afe2b928f0585019cdca8534e92bba1ddaeeb1e4e2d8e29eb2dc7657f6008876ad0cb89b03aa69a473dc378f6c12cd0e19299ed14cb820'
