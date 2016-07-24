require "spec_helper"

feature "finishing game" do
  context 'when player 1 reaches 0 HP' do
    before do
      sign_in_and_play
      click_button "Attack"
      click_link "OK"
      allow(Kernel).to receive(:rand).and_return(100)
      click_button "Attack"
    end

    scenario "player 1 loses" do
      expect(page).to have_content("player1 lost")
    end
  end
end
