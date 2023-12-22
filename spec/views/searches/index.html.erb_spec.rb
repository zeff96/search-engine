require 'rails_helper'

RSpec.describe 'searches/index.html.erb', type: :view do
  before do
    assign(:searches, [create(:user_query, query: 'Search 1'), create(:user_query, query: 'Search 2')])
    render
  end

  it 'renders the search form' do
    expect(rendered).to have_selector('form[action="/searches"][method="get"]') do
      expect(rendered).to have_selector('input[type="text"][name="q"][placeholder="Search"][class="rounded w-6/12"]')
    end
  end

  it 'displays a list of most popular searches' do
    expect(rendered).to have_selector('h2', text: 'Most Popular searches')
    expect(rendered).to have_selector('.flex.justify-between p', count: 2)
    expect(rendered).to have_selector('.flex.justify-between p', text: 'Search 1')
    expect(rendered).to have_selector('.flex.justify-between p', text: 'Search 2')
  end
end
