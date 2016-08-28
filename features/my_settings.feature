@javascript
Feature: My Settings
  As a valid amaysim user
  I want to update my settings
  So that my account can by managed as expected

  Background:
    Given I am a valid amaysim user
    And my amaysim number is "0468827174"
    And my password is "theHoff34"

  @reset-sim-nickname
  Scenario: update SIM nickname
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    And I click on the edit button for SIM Nickname
    And I enter "$^%HGVVH" as the SIM Nickname
    And I click on the save button
    Then I should see validation message as "Please enter a valid SIM name."
    When I enter "John Doe" as the SIM Nickname
    And I click on the save button
    Then the SIM Nickname is updated to "John Doe" successfully

  @reset-recharge-pin
  Scenario: update recharge PIN
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    And I click on the edit button for recharge PIN
    And I enter "$^%HGVVH" as the recharge PIN
    And I click on the save button
    Then I should see validation message as "Please enter a 4-digit top-up PIN number."
    When I enter "4321" as the recharge PIN
    And I click on the save button
    Then the recharge PIN is updated to "4321" successfully

  Scenario: update caller ID status
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the caller ID should be disabled
    When I click on the checkbox
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is ticked
    When I click on the checkbox
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is unticked

  Scenario: update call waiting status
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the call waiting should be disabled
    When I click on the checkbox
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is ticked
    When I click on the checkbox
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is unticked

  Scenario: update voicemail status
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the voicemail should be disabled
    When I click on the checkbox
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is ticked
    When I click on the checkbox
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is unticked

  @broken
  Scenario: update usage Alerts status
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the usage alerts should be disabled
    When I click on the checkbox
    Then I should see the confirmation modal
    When I click on yes
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is ticked
    When I click on the checkbox
    Then I should see the confirmation modal
    When I click on yes
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is unticked

  Scenario: update international roaming status
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the international roaming should be disabled
    When I click on the checkbox
    Then I should see the confirmation modal
    When I click on yes
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is ticked
    When I click on the checkbox
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then the checkbox is unticked

  @important
  Scenario: update Call forwarding status happy case
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the call forwarding should be disabled
    When I click on the edit button for call forwarding
    Then I should see the call forwarding confirmation modal
    When I click on confirm
    When I enter "0430202666" as the phone number
    And I click on the save button
    Then I should see the successful confirmation message
    When I close the modal pop-up
    Then I should see the call forwarding has been successfully set up to number "0430202666"
    When I click on the edit button for call forwarding
    Then I should see the call forwarding confirmation modal
    When I click on confirm
    And I click on the No radio button
    And I click on the save button
    Then the call forwarding should be disabled

  @important
  Scenario: update Call forwarding status with invalid number
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the call forwarding should be disabled
    When I click on the edit button for call forwarding
    Then I should see the call forwarding confirmation modal
    When I click on confirm
    And I enter "uhih%^&%_-5" as the phone number
    And I click on the save button
    Then I should see validation message as "Please enter your phone number in the following format: 0412 345 678 or 02 1234 5678"

  Scenario: update premium SMS limit status
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the premium SMS limit should be disabled
    And I click on the edit button for premium SMS limit
    And I select "$10" as the limit
    And I click on the save button
    Then I should see the new limit is set to "$10"
    When I click on the edit button for premium SMS limit
    And I select "OFF" as the limit
    And I click on the save button
    Then the premium SMS limit should be disabled

  Scenario: update auto-recharge status
    Given I am logged in as a valid user
    When I navigate to "My Settings" page
    Then the auto recharge should be disabled
    And I click on the edit button for auto recharge
    And I click on the save button
    Then I should see the auto recharge is set to "$10 whenever the balance drops below $2"
    And I click on the edit button for auto recharge
    And I click on the No radio button
    And I click on the save button
    Then the auto recharge should be disabled