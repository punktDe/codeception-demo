Feature:
  As a website user
  in order to call punkt.de
  I want to use the contact button

  Scenario: Contact button opens a popup with phone number
    Given I am on "/"
    And I click on "Kontakt"
    Then I should see "+49(0)721 / 9109-0"

