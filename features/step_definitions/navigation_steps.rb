Given /^the following navigations:$/ do |navigations|
  Navigation.create!(navigations.hashes)
end

Then 'I should see the "new post" form' do 
  assert_select "form[action=?]", "/posts"
end

When /^I delete the (\d+)(?:st|nd|rd|th) navigation$/ do |pos|
  visit navigations_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following navigations:$/ do |expected_navigations_table|
  expected_navigations_table.diff!(tableish('table tr', 'td,th'))
end
