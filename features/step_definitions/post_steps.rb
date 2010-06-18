When /^I fill the post form with the title of "([^"]*)"$/ do |title|
  fill_in 'post_title', :with => title
  fill_in 'post_body', :with => "Let's try this shit again."
end

When /^an old post exists with a title of "([^"]*)"$/ do |title|
  Factory :post, :title => title, :created_at => 1.day.ago, :published => true
end

When /^that an unpublished post exists$/ do
  Factory :post, :published => false 
end
