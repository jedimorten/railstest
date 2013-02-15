Feature: Viewing surveys
  In order to assign data to a survey
  As a user
  I want to be able to see a list of available surveys

  Scenario: Listing all surveys
    Given there is a survey called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    Then I should be on the survey page for "TextMate 2"
