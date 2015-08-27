require 'rails_helper'

describe 'index page', js: true do

  it 'should have correct company email' do
    visit root_path
    expect(page).to have_content('octohellstore@gmail.com')
  end

=begin
  pending 'should open personal page' do
  end

  pending 'should have slider' do
  end

  pending 'should have categories' do
  end
=end


end
