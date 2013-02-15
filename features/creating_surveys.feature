Feature: Creating surveys
          In order to have surveys to assign data to
          As a user
          I want to create them easily

          Scenario: Creating a survey
            Given I am on the homepage
            When I follow "New Survey"
            And I fill in "Name" with "Animals"
            And I press "Create Survey"
            Then I should see "Survey has been created."
