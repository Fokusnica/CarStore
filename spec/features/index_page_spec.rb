require 'rails_helper'

describe 'index page', js: true do

  it 'should have correct company email' do
    visit ''
    expect(page).to have_content('octohellstore@gmail.com')
  end

end
