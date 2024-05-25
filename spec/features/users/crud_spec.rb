require 'rails_helper'

RSpec.describe "basic User functions", type: :feature do
  describe "user creation" do
    it "creates a new user with a name, email and password" do
      visit root_path

      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Log In")

      click_on "Sign Up"

      expect(page).to have_content("Create New User")

      fill_in "Name", with: "Test"
      fill_in "Email", with: "Test@test.test.com"
      fill_in "Password", with: "Test1234"
      fill_in "Password Confirmation", with: "Test1234"

      click_on "Complete Sign Up"

      expect(page).to have_content("Welcome, Test!")
    end

    it "creates throws an error if passwords don't match" do
      visit root_path

      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Log In")

      click_on "Sign Up"

      expect(page).to have_content("Create New User")

      fill_in "Name", with: "Test"
      fill_in "Email", with: "Test@test.test.com"
      fill_in "Password", with: "Test1df234"
      fill_in "Password Confirmation", with: "Test1234"

      click_on "Complete Sign Up"

      expect(page).to have_content("FAILED to Create User!")
    end
  end
end
