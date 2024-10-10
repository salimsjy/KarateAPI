Feature: User API Test

  Background: :
    Given url "https://petstore.swagger.io/"
    And print "--opening userstore API--"

  Scenario: Get User
    When url "https://petstore.swagger.io/user/salim"
    And method get
    Then print response
    And status 200