require 'rails_helper'

describe 'myaccount page', js: true do
  it 'should have user name input field' do
    visit myaccount_index_path
    expect(page).to have_css('input#user_name')
  end

  it 'should have user email input field' do
    visit myaccount_index_path
    expect(page).to have_css('input#user_email')
  end

  it 'should have user password input field' do
    visit myaccount_index_path
    expect(page).to have_css('input#user_password')
  end

  it 'should have user password confirmation input field' do
    visit myaccount_index_path
    expect(page).to have_css('input#user_password_confirmation')
  end
end
