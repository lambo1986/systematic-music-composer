require 'rails_helper'

RSpec.describe "Song Show", type: :feature do
  it "displays a song's attributes" do
    user = User.create!(name: "Nate", email: "nate@doink.com", password: "123boom", password_confirmation: "123boom")
    song1 = user.songs.create!(title: "Dino Fight", genre: "Rock", vibe: "Angry", description: "2 Dinos Battling with Guitars", tempo: 167, form: "AABA", lyrics: "none", instrumentation: "Guitar, Bass, Drums")

    expect(user.songs.count).to eq(1)
    expect(song1.title).to eq("Dino Fight")

    visit "/users/#{user.id}/songs"

    expect(page).to have_content(user.name)
    expect(page).to have_content(song1.title)
    expect(page).to have_link(song1.title)

    click_link(song1.title)

    expect(current_path).to eq("/users/#{user.id}/songs/#{song1.id}")
    expect(page).to have_link("Back to All Songs")
    expect(page).to have_content(song1.title)
    expect(page).to have_content(song1.genre)
    expect(page).to have_content(song1.vibe)
    expect(page).to have_content(song1.description)
    expect(page).to have_content(song1.tempo)
    expect(page).to have_content(song1.form)
    expect(page).to have_content(song1.instrumentation)
    expect(page).to have_content(song1.lyrics)

    click_link("Back to All Songs")

    expect(current_path).to eq("/users/#{user.id}/songs")
  end
end
