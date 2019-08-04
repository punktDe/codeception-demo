Feature:
  As a website user
  in order to find what I am looking for
  I want to be able to use the search

  Scenario Outline:
    Examples:
      | Search term                    | Expected pages |
      | TYPO3                          | 10             |
      | Neos                           | 7              |
      | something completeley differnt | 0              |
    Given I am on "/"
    And I fill in "search" with "<Search term>"
    And I click on "Suchen"
    Then I should see "<Expected pages>" "ul.pagination > li" elements
