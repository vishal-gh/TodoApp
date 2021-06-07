Feature: Test App

Scenario: Goto home page

Given I need to goto the homepage
When I am on the homepage
Then I should see "Todo Lists"

Scenario: Add new list

Given I am on the homepage
Then I will click Add New Todo List link
Then I should see "New Todo List"
Then fill out title as "Test Title - Capybara" and description as "Test description - Capybara" and click Add
Then I should see "Test Title - Capybara" and "Test description - Capybara"
