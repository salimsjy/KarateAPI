Feature: User API Tests

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API"

  Scenario: Create New User with Array
    * def reqBody = [{"id": 9000,"username": "qa1","firstName": "qa satu","lastName": "satu","email": "qasatu@gmail.com","password": "password","phone": "081283884345","userStatus": 1}{"id": 9001,"username": "qa2","firstName": "qa dua","lastName": "dua","email": "qadua@gmail.com","password": "password","phone": "08787377383","userStatus": 0}{"id": 9002,"username": "qa3","firstName": "qa tiga","lastName": "tiga","email": "qatiga@gmail.com","password": "password","phone": "08787379383","userStatus": 1}]
    When url "https://petstore.swagger.io/v2/user/createWithArray"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Create New User with List
    * def reqBody = [{"id": 9011,"username": "qa11","firstName": "qa sebelas","lastName": "sebelas","email": "qasebelas@gmail.com","password": "password","phone": "08654374832","userStatus": 1},{"id": 9012,"username": "qa12","firstName": "qa dua belas","lastName": "dua belas","email": "qaduabelas@gmail.com","password": "password","phone": "08054374832","userStatus": 1}]
    When url "https://petstore.swagger.io/v2/user/createWithList"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Get User by Username
    When url "https://petstore.swagger.io/v2/user/qa"
    And method get
    Then print response
    And status 200

  Scenario: Update User
    * def reqBody = {"id": 9000,"username": "qa 1","firstName": "qa satuu","lastName": "satu","email": "qasatu@gmail.com","password": "password","phone": "081283884345","userStatus": 0}
    When url "https://petstore.swagger.io/v2/user/qa1"
    And method put
    Then print response
    And status 415

  Scenario: Delete User
    When url "https://petstore.swagger.io/v2/user/string"
    When method delete
    Then print response
    And status 200

  Scenario: Login User
    When url "https://petstore.swagger.io/v2/user/login"
    And param username = 'qa11'
    And param password = 'password'
    And method get
    Then print response
    And status 200

  Scenario: Logout User
    And method get
    Then print response
    When url "https://petstore.swagger.io/v2/user/logout"
    And status 200

  Scenario: Create New User
    * def reqBody = {"id": 1870,"username": "qa","firstName": "string","lastName": "string","email": "string","password": "password","phone": "string","userStatus": 0}
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200