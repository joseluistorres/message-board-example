feature 'Navigation links', :devise do

  scenario 'view navigation links' do
    user = FactoryGirl.create(:user)
    post2 = FactoryGirl.create(:post, title: "Circle of Life", body: "This is just a text",user: user)
    comment = FactoryGirl.create(:comment, post: post2)
    visit root_path
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Num Comments: 1'
  end

end
