Feature:
  In order to function correctly
  As a frontend application
  The Api has to respond properly

  Background:
    Given dataset "../../Resources/Private/Fixture/LoginFixture.yaml" is imported
    And dataset "../../Tests/Behavior/Features/JSApi/Fixtures/EmptyTransaction.yaml" is imported

  Scenario: Logged in user has access to page, receives data by entering neccessary data and sends a finish request
    Given the api is logged in as "Mitarbeiter"
    And I do a GET request on "/ajaxapi/PunktDe.JSApi/getData/arguments[input]=TUTSICHER1"
    Then the HTTP status code should be "200"
    And the api response should be valid json
    And the api response should return a JSON string with fields:
      | status      | 0 |
      | transaction | 1 |

    Then the database query "SELECT uid, input, output, finish_date FROM tx_pt_jsapi_domain_model_data" should return
      | uid | input      | output | finish_date |
      | 1   | TUTSICHER1 | 0      | 0           |

    When I do a GET request on "/ajaxapi/PunktDe.JSApi/getData/finish/arguments[id]=1"
    Then the HTTP status code should be "200"
    And the api response should be valid json
    And the api response should return a JSON string with fields:
      | status | 0 |

    And the database query "SELECT uid, FROM_UNIXTIME(finish_date,'%Y%m%d') as finishDate FROM tx_pt_jsapi_domain_model_data limit 1" should return
      | uid | finishDate        |
      | 1   | [[[CURRENT_DAY]]] |

  Scenario: Not Logged in user gets error when trying to call api
    Given I do a GET request on "/ajaxapi/PunktDe.JSApi/getData/arguments[input]=ERROR"
    Then the HTTP status code should be "403"
    And the api response should be valid json
    And the api response should return a JSON string with fields:
      | status      | 1564693375 |
