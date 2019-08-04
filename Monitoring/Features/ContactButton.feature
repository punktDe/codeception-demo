Feature:
  As a website user
  in order to get information on punkt.de
  I want to use the main page

  Scenario: Main page is available
    Given I am on "/"
    Then I should see "Lösungen für digitale Herausforderungen"
    And I should see an ".navbar-logo__link" element

