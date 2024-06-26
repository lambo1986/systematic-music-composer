require 'rails_helper'

RSpec.describe "user's songs index page", type: :feature do
  it "can see a list of user's songs" do
    user = User.create!(name: "Nate", email: "nate@doink.com", password: "123boom", password_confirmation: "123boom")
    song1 = user.songs.create!(title: "Dino Fight", genre: "Rock", vibe: "Angry", description: "2 Dinos Battling with Guitars", tempo: 167, form: "AABA", lyrics: "none", instrumentation: "Guitar, Bass, Drums")
    song2 = user.songs.create!(title: "Milawalkay", genre: "Butt-Rock", vibe: "Sad", description: "Partners no more", tempo: 111, form: "AABAC", lyrics: "You and I were meant for bigger things", instrumentation: "Guitar, Bass, Drums, Sax")

    expect(user.songs.count).to eq(2)
    expect(song1.title).to eq("Dino Fight")
    expect(song2.title).to eq("Milawalkay")

    visit "/users/#{user.id}/songs"

    expect(page).to have_content(user.name)
    expect(page).to have_content(song1.title)
    expect(page).to have_link(song1.title)
  end
end
