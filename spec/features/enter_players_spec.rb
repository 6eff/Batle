require 'spec_helper'

feature "entering players form" do
  scenario "user enters his name" do
    sign_in_and_play
    expect(page).to have_text('player1 vs player2')
  end

  scenario "displaying player hit points" do
    sign_in_and_play
    expect(page).to have_content('player1 100 vs player2 100')
  end
end
