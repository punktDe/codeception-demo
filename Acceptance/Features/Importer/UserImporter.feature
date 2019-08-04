Feature: As a website
  in order to enable people to use me
  I need to import user data

  Background:
    Given dataset "Acceptance/Features/Login/LoginFixture.yaml" is imported

  Scenario: User data is imported without overwriting old data
    When I run "php vendor/bin/typo3 user:import" in "/var/www/"
    Then the output should be "Success!"
    Then the database query "SELECT uid, pid, username FROM fe_users ORDER BY uid ASC" should return
      | uid | pid | username         |
      | 1   | 31  | my_testuser      |
      | 2   | 31  | special_testuser |
      | 3   | 31  | import_testuser  |
