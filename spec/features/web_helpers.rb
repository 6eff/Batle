def sign_in_and_play
  visit '/'
  fill_in("player1", with: "player1")
  fill_in('player2', with: 'player2')
  click_button ('enter')
end
