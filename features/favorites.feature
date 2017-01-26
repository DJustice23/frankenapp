Feature: favoriting a blog post

  Scenario: adding a favorite
    Given I'm a user
    When I favorite a post
    Then that post is in my favorites
    And I am in the posts' followers

  Scenario: favoriting using the web
    Given I'm logged in
    And I'm viewing "How to Ruby"
    When I click the favorite button
    Then "How to Ruby" should be in my favorites