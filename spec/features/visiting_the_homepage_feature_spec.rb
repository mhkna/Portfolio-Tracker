require_relative '../rails_helper'

feature "Visiting the homepage while not logged in" do
  let!(:user) {User.create!(email: "tom@tom.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }
  let!(:portfolio) {user.portfolios.create!(portfolio_name: 'My Portfolio')}

  scenario "redirects to Portfolios index with valid login credentials" do
  	visit('/')

  	fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: '1234567812345678123456781234567812345678123456781234567812345678')
		click_button('Log in')

		expect(page).to have_current_path portfolios_path
  end

  scenario "returns to login page if invalid credentials are entered" do
  	visit ('/')

  	fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'wheeeeeee')
		click_button('Log in')

  	expect(page).to have_current_path new_user_session_path
	end
end

feature "Signing up a new user" do

	scenario "redirects to 'Sign Up' page when the 'Sign Up' link is clicked" do
		visit("/")

		click_link("Sign up")
		expect(page).to have_current_path new_user_registration_path
	end

	scenario "redirects to 'Sign Up' page when invalid registration input is provided" do
		visit new_user_registration_path

			fill_in('Email', with: 'tom@tom.com')
			fill_in('Password', with: 'wheeeeeee')
			fill_in('Password confirmation', with: "sgjsjdhjdsf")
			click_button('Sign up')

		expect(page).to have_current_path "/users" #This is odd, but it's Devise's doing...
	end

	scenario "redirects to Portfolios index page when valid registration input is provided" do
		visit new_user_registration_path

			fill_in('Email', with: 'tom@tom.com')
			fill_in('Password', with: '1234567812345678123456781234567812345678123456781234567812345678')
			fill_in('Password confirmation', with: "1234567812345678123456781234567812345678123456781234567812345678")		
			click_button("Sign up")

		expect(page).to have_current_path portfolios_path
	end
end

# feature "When a user logs out" do
# 	let!(:user) {User.create!(email: "tom@tom.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }

# 	scenario "clicking the 'log out' link logs the user out" do

# 		visit portfolios_path
# 		page.find_by_id("navbar")

# 		expect(page).to have_current_path "/"
# 	end#######
# end