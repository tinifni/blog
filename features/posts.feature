Feature: Posts

  Scenario: Create a new post
    Given I am on the new post page
    When I create a post titled "A new post"
    Then I should see "A new post"
