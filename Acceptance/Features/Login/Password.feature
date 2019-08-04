Feature:
  In order to use the intranet
  as a registered user
  I want to be able to login via password and username

  Background:
    Given dataset "Acceptance/Features/Login/LoginFixture.yaml" is imported

  Feature: Password login works
    And I am on "/"
    When I fill in "Username" with "testuser"
    And I fill in "Password" with "testpassword"
    And I click on "Login"
    Then I should see "You are logged in as testuser"
