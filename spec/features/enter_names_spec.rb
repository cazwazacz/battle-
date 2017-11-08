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
    click_button('attack')
    expect(page).to have_content "You've attacked Dania!"
  end

  it 'player 1 attacks player 2 and reduces hp by 10' do
    sign_in_and_play
    click_button('attack')
    expect(page).to have_content "100HP ____ 90HP"
  end

  it 'player 2 attacks player 1 and receives confirmation' do
    sign_in_and_play
    2.times { click_button('attack') }
    expect(page).to have_content "You've attacked Allan!"
  end

  it 'player 2 attacks player 1 and reduces hp by 10' do
    sign_in_and_play
    2.times { click_button('attack') }
    expect(page).to have_content "90HP ____ 90HP"
  end
end
