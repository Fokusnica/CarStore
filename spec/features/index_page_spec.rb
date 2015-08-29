require 'rails_helper'

describe 'index page', js: true do

  it 'should have correct company email' do
    visit root_path
    expect(page).to have_content('octohellstore@gmail.com')
  end

  pending 'should open personal page'

  pending 'should have slider'

  pending 'should have categories'

  pending 'should have search field'

  peding 'should have recommended item carousel'

  peding 'should open videos'

end
