require "spec_helper"

feature "switch turns" do
  scenario "users switch turns at discretion" do
    sign_in_and_play
    click_button("switch")
    expect(page).to have_content "player2 vs player1"
  end
end
