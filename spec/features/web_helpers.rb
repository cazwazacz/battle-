def sign_in_and_play
  visit '/'
  fill_in('player1', with: 'Allan')
  fill_in('player2', with: 'Dania')
  click_on('Fight')
end