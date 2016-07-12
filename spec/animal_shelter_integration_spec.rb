require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add an animal path', {:type => :feature}) do
  it('lets users add a new animal to the shelter database') do
    visit('/')
    click_link('Admin Page')
    click_link('Add an Animal')
    fill_in('name',:with=>'Boo')
    fill_in('entry_date',:with=>'2016-07-12')
    select('f',:from=>'gender')
    select('fish',:from=>'type')
    fill_in('breed',:with=>'goldfish')
    fill_in('friend_id',:with=>1)
    click('Submit')
    expect(page).to have_content('Add an Animal')
  end
end
