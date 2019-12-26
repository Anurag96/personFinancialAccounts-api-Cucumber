Feature: Delete person financial account

  Background:

    Given message pfaPOSTRequest
    And <pfaPOSTRequest> header Content-Type is "application/json"
    And <pfaPOSTRequest> header citrus_http_method is "POST"
    And <pfaPOSTRequest> header Tenantid is "${tenantId}"
    And <pfaPOSTRequest> header Transactionid is "${globalTransactionId}"
    And <pfaPOSTRequest> payload is
    """
{
  "accountHolder": {
    ${personResourceId}
  }
}
    """

    Given message pfaPOSTResponse
    And <pfaPOSTResponse> header Content-Type is "@startsWith('application/json;charset=utf-8')@"
    And <pfaPOSTResponse> header citrus_http_status_code is "201"
    And <pfaPOSTResponse> header citrus_http_reason_phrase is "CREATED"
    And <pfaPOSTResponse> payload is
    """
 {"resourceId": "@variable('resourceId')@",
    "createdDateTime": "@variable('createdDateTime')@",
    "updatedDateTime": "@variable('updatedDateTime')@",
    "accountHolder": {
        ${personResourceId}
    },
    "_links": {
        "self": {
            "href": "@variable('href')@"
        }
    }
    }
"""
    Given message kafkaLatestTopicInsertResponse
    And <kafkaLatestTopicInsertResponse> payload is
    """
    {
      "messageVersion": 1,
      "header": {
        "operation":"INSERT",
        "originalSource":"PEPPFACT",
        "publisher":"PEPPFACT",
        "transactionId":"${globalTransactionId}",
        "tenantId":${tenantId}
      },
      "payload": {
        "resourceId": "@variable('resourceId')@",
        "createdDateTime": "@variable('createdDateTime')@",
        "updatedDateTime": "@variable('updatedDateTime')@",
        "accountHolder": {
          ${personResourceId}
        },
        "links": []
      }
    }
    """

    Given message kafkaChangeTopicInsertResponse
    And <kafkaChangeTopicInsertResponse> payload is
    """
    {
      "messageVersion": 1,
      "header": {
        "operation": "INSERT",
        "originalSource": "PEPPFACT",
        "publisher": "PEPPFACT",
        "transactionId":"${globalTransactionId}",
        "tenantId":${tenantId}
      },
      "payload": {
        "data": {
          "resourceId": "@variable('resourceId')@",
          "createdDateTime": "@variable('createdDateTime')@",
          "updatedDateTime": "@variable('updatedDateTime')@",
          "accountHolder": {
            ${personResourceId}
          },
          "links": []
        }
      }
    }
    """

    Given message pfaDELETERequest
    And <pfaDELETERequest> header Content-Type is "application/json"
    And <pfaDELETERequest> header citrus_http_method is "DELETE"
    And <pfaDELETERequest> header Tenantid is "${tenantId}"
    And <pfaDELETERequest> header Transactionid is "${globalTransactionId}"
    And <pfaDELETERequest> header citrus_request_path is "/${resourceId}"

    Given message pfaDELETEResponse
    And <pfaDELETEResponse> header citrus_http_status_code is "200"
    And <pfaDELETEResponse> header citrus_http_reason_phrase is "OK"

    Given message pfaGetRequest
    And <pfaGetRequest> header Content-Type is "application/json"
    And <pfaGetRequest> header citrus_http_method is "GET"
    And <pfaGetRequest> header Tenantid is "${tenantId}"
    And <pfaGetRequest> header Transactionid is "${globalTransactionId}"
    And <pfaGetRequest> header citrus_request_path is "/${resourceId}"

    Given message pfaGetResponse
    And <pfaGetResponse> header citrus_http_status_code is "200"
    And <pfaGetResponse> header citrus_http_reason_phrase is "OK"
    And <pfaGetResponse> payload is
    """
 {"resourceId": "${resourceId}",
    "createdDateTime": "@variable('createdDateTime')@",
    "updatedDateTime": "@variable('updatedDateTime')@",
    "accountHolder": {
        ${personResourceId}
    },
    "_links": {
        "self": {
            "href": "@variable('href')@"
        }
    }
    }
"""

    Given message pfaErrorResponse
    And <pfaErrorResponse> header citrus_http_status_code is "${hTTPErrorCode}"
    And <pfaErrorResponse> header citrus_http_reason_phrase is "${hTTPErrorMessage}"
    And <pfaErrorResponse> payload is
    """

    """

    Given message kafkaLatestTopicDeleteResponse
    And <kafkaLatestTopicDeleteResponse> payload is
    """
    {
        "messageVersion":1,
        "header":{
            "operation":"DELETE",
            "originalSource":"${headerOriginalSource}",
            "publisher":"${headerPublisher}",
            "transactionId":"${globalTransactionId}",
            "tenantId":${tenantId}
        }
    }
    """

    Given message kafkaChangeTopicDeleteResponse
    And <kafkaChangeTopicDeleteResponse> payload is
    """
    {
        "messageVersion":1,
        "header":{
            "operation":"DELETE",
            "originalSource":"${headerOriginalSource}",
            "publisher":"${headerPublisher}",
            "transactionId":"${globalTransactionId}",
            "tenantId":${tenantId}
        },
        "payload": {
            "beforeData": {
              "resourceId": "@variable('resourceId')@",
              "createdDateTime": "@variable('createdDateTime')@",
              "updatedDateTime": "@variable('updatedDateTime')@",
              "accountHolder": {
                ${personResourceId}
              },
              "links": []
            }
          }
        }
    """


  @DEV
  @API
  Scenario:1 Post an person financial account, Get posted PFA, Delete PFA and confirm that the record is no more exists

    Given variables
      | hTTPErrorCode                        | 404                                         |
      | hTTPErrorMessage                     | NOT_FOUND                                   |
      | id1                                  | citrus:randomUUID()                         |
      | personResourceId                     | "personResourceId":"${id1}"                 |
      | customerNumber                       | citrus:randomString(12, UPPERCASE, true)    |
      | mailGroup                            | citrus:randomString(3, UPPERCASE, false)    |
      | subGroup                             | citrus:randomString(7, UPPERCASE, true)     |
      | membershipId                         | citrus:randomNumber(12)                     |
      | headerOriginalSource                 | PEPPFACT                                    |
      | headerSourceDateTime                 | citrus:currentDate('yyyy-MM-dd'T'hh:mm:ss') |
      | headerPublisher                      | PEPPFACT                                    |
      | insertTransactionId                  | citrus:randomString(33, MIXED, true)        |
      | updateTransactionId                  | citrus:randomString(34, MIXED, true)        |
      | deleteTransactionId                  | citrus:randomString(35, MIXED, true)        |
      | currentBalanceAmount                 | citrus:randomNumber(2)                      |
      | newCurrentBalanceAmount              | citrus:randomNumber(2)                      |
      | currency                             | USD                                         |
      | totalChargesInProcessAmount          | 0.00                                        |
      | agingBalances1DaysAged               | 30                                          |
      | agingBalances1DaysAgedAmount         | 50.00                                       |
      | agingBalances2DaysAged               | 60                                          |
      | agingBalances2DaysAgedAmount         | 25.00                                       |
      | agingBalances3DaysAged               | 90                                          |
      | agingBalances3DaysAgedAmount         | 15.00                                       |
      | oldestCreditCreditAmount             | 0.00                                        |
      | currentFloorLimitBaseLimitAmount     | 150.00                                      |
      | currentFloorLimitHighCostLimitAmount | 150.00                                      |
      | tenantId                             | 12345678                                    |

    #Create a record
    When <pfaClient> sends message <pfaPOSTRequest>
    And <pfaClient> should receive JSON message <pfaPOSTResponse>

    #Get inserted Record
    When <pfaClient> sends message <pfaGetRequest>
    And <pfaClient> should receive JSON message <pfaGetResponse>

    #Verifying the messages posted to Latest topic
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicInsertResponse>

    #Verifying the messages posted to Change topic
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicInsertResponse>

    #Deleting an existing record
    When <pfaClient> sends message <pfaDELETERequest>
    And <pfaClient> should receive JSON message <pfaDELETEResponse>

    #Get deleted Record
    When <pfaClient> sends message <pfaGetRequest>
    And <pfaClient> should receive JSON message <pfaErrorResponse>

    #Verifying the messages posted to Latest topic
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicDeleteResponse>

    #Verifying the messages posted to Change topic
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicDeleteResponse>


  @DEV
  @API
  Scenario: Gets 404 response for Not Found resource id
    Given variables
      | resourceId       | 9609d8ed-fa9d-45b0-99c7-1f5ab97750c2 |
      | hTTPErrorCode    | 404                                  |
      | hTTPErrorMessage | NOT_FOUND                            |
      | tenantId         | 12345678                             |

    When <pfaClient> sends message <pfaDELETERequest>
    Then <pfaClient> should receive JSON message <pfaErrorResponse>


  @DEV
  @API
  Scenario: Gets 404 response for invalid resource ID

    Given variables
      | resourceId       | c64e0-091a-4237-1f90-30db1a8cf481 |
      | hTTPErrorCode    | 404                               |
      | hTTPErrorMessage | NOT_FOUND                         |
      | tenantId         | 12345678                          |

    When <pfaClient> sends message <pfaDELETERequest>
    Then <pfaClient> should receive JSON message <pfaErrorResponse>

  @DEV
  @API
  Scenario: Gets error response for blank resource ID

    Given variables
      | resourceId       |                    |
      | hTTPErrorCode    | 405                |
      | hTTPErrorMessage | METHOD_NOT_ALLOWED |
      | tenantId         | 12345678           |

    When <pfaClient> sends message <pfaDELETERequest>
    Then <pfaClient> should receive JSON message <pfaErrorResponse>

  @DEV
  @API
  Scenario: Gets error response for null resource ID

    Given variables
      | resourceId       |                    |
      | hTTPErrorCode    | 405                |
      | hTTPErrorMessage | METHOD_NOT_ALLOWED |
      | tenantId         | 12345678           |

    When <pfaClient> sends message <pfaDELETERequest>
    Then <pfaClient> should receive JSON message <pfaErrorResponse>