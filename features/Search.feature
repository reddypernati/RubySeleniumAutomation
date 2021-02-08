Feature: Validate Search Functionality

  Scenario: Search Item on Application
    When User enter search item
    And User click on Search
    Then User navigate to search result page
