Feature: Posts

  Scenario: Create a new post
    Given I am on the new post page
    When I fill the post form with the title of "A new post"
    And I check "Published"
    And I press "Create"
    Then I should see "Created"
    And I should see "A new post"

  Scenario: Fail to enter in a valid title
    Given I am on the new post page
    When I fill in "Title" with ""
    And I fill in "Body" with ""
    And I press "Create"
    Then I should see "Title can't be blank"
    And I should see "Body can't be blank"

  Scenario: View posts on index page
    Given an old post exists with a title of "My old post"
    When I am on the posts page
    Then I should see "My old post"

  Scenario: Only display published posts on index
    Given the following posts exist:
      | title              | body   | published |
      | "Published Post"   | "body" | true      |
      | "Unpublished Post" | "body" | false     |
    When I am on the posts page
    Then I should see "Published Post"
    And I should not see "Unpublished Post"
    
