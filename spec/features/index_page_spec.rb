require 'rails_helper'

describe 'index page', js: true do

  it 'should have correct company email' do
    visit root_path
    expect(page).to have_content('octohellstore@gmail.com')
  end

  it 'should have slider' do
    visit root_path
    expect(page).to have_css('div#slider-carousel')
  end

  it 'should have categories' do
    visit root_path
    expect(page).to have_css('div.category-products')
  end

  it 'should have search field' do
    visit root_path
    expect(page).to have_css('input#search')
  end

  it 'should have recommended items' do
    visit root_path
    expect(page).to have_css('div.recommended_items')
  end

  it 'should have video gallery' do
    visit root_path
    expect(page).to have_css('div.video-gallery')
  end

end
