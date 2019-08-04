Feature:
  As registered users
  In order to communicate with each other
  I want to be able to use the forum

  Background:
    Given dataset "../../Resources/Private/Fixture/LoginFixture.yaml" is imported
    And dataset "../../Tests/Behavior/Features/Forum/Fixture/Forum.yaml" is imported


  Scenario: When I add a topic in the forum there are no errors
    Given I am logged in as "Mitarbeiter"
    And I go to "/nc/forum.html"
    And I follow "Unterforum für Mitarbeiter"
    And I follow "Thema für Mitarbeiter"
    Then I should see "Themeninhalt"
    And I wait for the text "Antworten"
    And I click on "Antworten"
    Then I should see an "#typo3forum_editor" element
    And I fill in "typo3forum_editor" with "testbeitrag"
    And I click on "Beitrag erstellen"
    And I should see "testbeitrag"
    Then I log myself out

  Scenario: I can see the added forum topic and can answer to it
    Given I am logged in as "SpecialUser"
    And I go to "/nc/forum.html"
    And I follow "Unterforum für Mitarbeiter"
    And I follow "Thema für Spezialuserantwort"
    And I should see "Hier antwortet der Spezialuser"
    And I wait for the text "Antworten"
    And I click on "Antworten"
    Then I should see an "#typo3forum_editor" element
    And I fill in "typo3forum_editor" with "Antwort des Spezialuser"
    And I click on "Beitrag erstellen"
    Then I should see "Hier antwortet der Soezialuser"
    And I should see "Antwort des Spezialuser"
    Then I log myself out
