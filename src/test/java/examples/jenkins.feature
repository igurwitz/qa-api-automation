Feature: Demo Karate with Jenkins

#  Scenario: Verify that Jenkins is up and running
#    Given url 'https://jenkins.signalsanalytics.co/api/json?pretty=true'
#    When method GET
#    Then status 403
#
#  Scenario: Verify Jenkins asks for authentication
#    def expected = 'You are authenticated as: anonymous'
#    Given url 'https://jenkins.signalsanalytics.co/api/json?pretty=true'
#    And def expected = 'You are authenticated as: anonymous'
#    When method GET
#    Then match $ contains expected
#    Then print response
#
#  Scenario: Authenticate Jenkins
#    * url 'https://jenkins.signalsanalytics.co/api/json?pretty=true'
#    And request ' --user admin:admin'
#    When method POST
#    Then print response
#
#  Scenario: Json file
#    Given def myJsonVar = read('demoJenkins.json')
#    Then print myJsonVar

  Scenario: Hierarchy Check
    Given url 'https://jsonplaceholder.typicode.com/todos/1'
    When method GET
    Then status 200
    And match response.userId == 1

  Scenario: User Json File Check
    * def myJsonUserVar = read('demoUser.json')

    Given url 'https://jsonplaceholder.typicode.com/todos/1'
    When method GET
    Then status 200
    And match response == myJsonUserVar
    And match response.title != null
    * def nonExistentField = response.nonExistentField
    And match nonExistentField == null