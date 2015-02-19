require 'spec_helper'

feature 'Wikipedia Home Page' do
  background do
    visit '/'
  end

  scenario 'Title Check' do
    expect(page).to have_title 'Wikipedia, the free encyclopedia'
  end

  scenario 'Search' do
    find('input#searchInput').set('Ohio')
    find('input#searchButton').click
    expect(find('h1#firstHeading').text).to eq "Ohio"
  end

end
