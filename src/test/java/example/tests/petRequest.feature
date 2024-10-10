Feature: Pet API Tests

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

  Scenario: Add New Pet to Store
    * def reqBody = {"id": 13,"category": {"id": 13,"name": "string"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 13,"name": "string"}],"status": "available"}
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Find Pet by Status
    When url "https://petstore.swagger.io/v2/pet/findByStatus?status=available"
    And method get
    Then print response
    And status 200

  Scenario: : Find Pet by ID
    When url "https://petstore.swagger.io/v2/pet/1436"
    And method get
    Then print response
    And status 200