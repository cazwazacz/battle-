describe 'Battle', :type => :feature do

  it 'takes names and shows them on screen' do
    sign_in_and_play
    expect(page).to have_content "Allan vs Dania"
  end

  it 'shows starting HitPoints numbers on screen' do
    sign_in_and_play
    expect(page).to have_content "100HP ____ 100HP"
  end

  it 'player 1 attacks player 2 and receives confirmation' do
    sign_in_and_play
    click_button('attack player2')
    expect(page).to have_content "You've attacked Dania!"
  end

  it 'player 1 attacks player 2 and reduces hp by 10' do
    sign_in_and_play
    click_button('attack player2')
    expect(page).to have_content "100HP ____ 90HP"
  end
end
