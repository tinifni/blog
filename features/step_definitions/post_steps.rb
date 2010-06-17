When 'I create a post titled "$post_title"' do |title|
  fill_in 'post_title', :with => title
  fill_in 'post_body', :with => "Let's try this shit again."
  click_button 'Create'
end

