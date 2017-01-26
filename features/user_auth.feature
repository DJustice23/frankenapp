Feature: authenticating users

  Scenario: failing to sign up
    Given I'm on the sign up page
    When try mis-matched passwords
    Then I should be on the sign up page
    And I should see that passwords don't match

  Scenario: signing up for new account
    Given I do not have an account
    And I'm on the sign up page
    When I register as james@example.com
    Then I should be on the home page
    And I have a user account

  Scenario: registering a taken email address
    Given user@example.com has an account
    And I'm on the sign up page
    When I register as user@example.com
    Then I should be on the sign up page
    And I should see that the email is taken
    And there should be no new user accounts

  Scenario: successful log in
    Given I'm an existing user
    And I navigate to the sign-in page
    When I enter my credentials and click log in
    Then I am signed in

  Scenario: successful log out
    Given I'm an existing user
    And I navigate to the sign-in page
    When I enter my credentials and click log in
    Then I am signed in
    When I click log out
    Then I am signed out

  Scenario: unsuccessful log in
    Given I do not have an account
    And I navigate to the sign-in page
    When I enter some credentials and click log in
    Then I am not signed in