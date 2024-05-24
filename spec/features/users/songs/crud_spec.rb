require 'rails_helper'

RSpec.describe "create, update, and destroy", type: :feature do
  describe "create song for a user" do
    it "creates a song for a user" do
      user = User.create!(name: "Nate", email: "nate@doink.com", password: "123boom", password_confirmation: "123boom")

      expect(user.name).to eq("Nate")
      expect(user.songs.count).to eq(0)

      visit "/users/#{user.id}/songs"

      expect(page).to have_link("New Song")

      click_on "New Song"

      expect(current_path).to eq("/users/#{user.id}/songs/new")
      expect(page).to have_content("Create New Song")

      fill_in "song[title]", with: "Rock ME Baby Doll"
      fill_in "song[genre]", with: "ShoeGazer"
      fill_in "song[vibe]", with: "Cool, yo!"
      fill_in "song[description]", with: "Slow and Low"
      fill_in "song[lyrics]", with: "Rock ME Baby Doll, oogh yeah just like a baby doll?"
      fill_in "song[tempo]", with: 77
      fill_in "song[form]", with: "AABAABBCAD"
      fill_in "song[instrumentation]", with: "Guitar, Drums, Bass, Synth"

      click_on "Create Song"

      expect(current_path).to eq("/users/#{user.id}/songs")
      expect(page).to have_content("Song successfully created!")
      expect(page).to have_content("Rock ME Baby Doll")
    end

    it "doesn't create a song for a user without all fields filled" do
      user = User.create!(name: "Nate", email: "nate@doink.com", password: "123boom", password_confirmation: "123boom")

      expect(user.name).to eq("Nate")
      expect(user.songs.count).to eq(0)

      visit "/users/#{user.id}/songs"

      expect(page).to have_link("New Song")

      click_on "New Song"

      expect(current_path).to eq("/users/#{user.id}/songs/new")
      expect(page).to have_content("Create New Song")

      fill_in "song[title]", with: ""
      fill_in "song[genre]", with: ""
      fill_in "song[vibe]", with: "Cool, yo!"
      fill_in "song[description]", with: "Slow and Low"
      fill_in "song[lyrics]", with: "Rock ME Baby Doll, oogh yeah just like a baby doll?"
      fill_in "song[tempo]", with: 77
      fill_in "song[form]", with: "AABAABBCAD"
      fill_in "song[instrumentation]", with: "Guitar, Drums, Bass, Synth"

      click_on "Create Song"

      expect(page).to have_content("Failed to create song. Please fill in all required fields.")
      expect(page).to have_content("Create New Song")
      expect(user.songs.count).to eq(0)
    end
  end
end
