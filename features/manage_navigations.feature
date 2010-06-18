Feature: Navigation Headers
  
  Scenario: Go to new post then back home
    When I am on the homepage
    And I follow "New post"
    Then I should see the "new post" form
    When I follow "Home"
    Then I should see "Posts"
