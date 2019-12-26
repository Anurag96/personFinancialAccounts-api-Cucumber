Feature: Search Personal Financial accounts search by AGN, MembershipId, Customer, Customer-MailGroup-SubGroup, Person Resource Id

  Background:

    Given message pfaGetByPersonResourceId
    And <pfaGetByPersonResourceId> header Content-Type is "application/json;charset=utf-8"
    And <pfaGetByPersonResourceId> header citrus_http_method is "GET"
    And <pfaGetByPersonResourceId> header Tenantid is "${tenantId}"
    And <pfaGetByPersonResourceId> header Transactionid is "${globalTransactionId}"
    And <pfaGetByPersonResourceId> header citrus_request_path is "/?personResourceId=${personResourceIdQry}"

    Given message pfaGetByIndividualAGN
    And <pfaGetByIndividualAGN> header Content-Type is "application/json;charset=utf-8"
    And <pfaGetByIndividualAGN> header Tenantid is "${tenantId}"
    And <pfaGetByIndividualAGN> header Transactionid is "${globalTransactionId}"
    And <pfaGetByIndividualAGN> header citrus_http_method is "GET"
    And <pfaGetByIndividualAGN> header citrus_request_path is "/?individualAGN=${individualAGNQry}"

    Given message pfaGetByMembershipId
    And <pfaGetByMembershipId> header Content-Type is "application/json;charset=utf-8"
    And <pfaGetByMembershipId> header Tenantid is "${tenantId}"
    And <pfaGetByMembershipId> header Transactionid is "${globalTransactionId}"
    And <pfaGetByMembershipId> header citrus_http_method is "GET"
    And <pfaGetByMembershipId> header citrus_request_path is "/?membershipId=${membershipIdQry}"

    Given message pfaGetByCustomerNumber
    And <pfaGetByCustomerNumber> header Content-Type is "application/json;charset=utf-8"
    And <pfaGetByCustomerNumber> header citrus_http_method is "GET"
    And <pfaGetByCustomerNumber> header Tenantid is "${tenantId}"
    And <pfaGetByCustomerNumber> header Transactionid is "${globalTransactionId}"
    And <pfaGetByCustomerNumber> header citrus_request_path is "/?customerNumber=${customerNumberQry}"

    Given message pfaGetByCMG
    And <pfaGetByCMG> header Content-Type is "application/json;charset=utf-8"
    And <pfaGetByCMG> header citrus_http_method is "GET"
    And <pfaGetByCMG> header Tenantid is "${tenantId}"
    And <pfaGetByCMG> header Transactionid is "${globalTransactionId}"
    And <pfaGetByCMG> header citrus_request_path is "/?customerNumber=${customerNumberQry}&mailGroup=${mailGroupQry}&subGroup=${subGroupQry}"

    Given message pfaGetByNulls
    And <pfaGetByNulls> header Content-Type is "application/json;charset=utf-8"
    And <pfaGetByNulls> header Tenantid is "${tenantId}"
    And <pfaGetByNulls> header Transactionid is "${globalTransactionId}"
    And <pfaGetByNulls> header citrus_http_method is "GET"
    And <pfaGetByNulls> header citrus_request_path is "/"

    Given message pfaGetEmptyResponse
    And <pfaGetEmptyResponse> header Content-Type is "@startsWith('application/json;charset=utf-8')@"
    And <pfaGetEmptyResponse> header citrus_http_status_code is "${httpCode}"
    And <pfaGetEmptyResponse> header citrus_http_reason_phrase is "${httpMessage}"
    And <pfaGetEmptyResponse> payload is
    """
    []
    """

    Given message pfaFullPOSTRequest
    And <pfaFullPOSTRequest> header Content-Type is "application/json;charset=utf-8"
    And <pfaFullPOSTRequest> header Tenantid is "${tenantId}"
    And <pfaFullPOSTRequest> header Transactionid is "${globalTransactionId}"
    And <pfaFullPOSTRequest> header citrus_http_method is "POST"
    And <pfaFullPOSTRequest> payload is
    """
    {
      "accountHolder": {
        ${personResourceId}
      },
      "currentBalance": {
        "amount": 0,
        "currency": "string"
      },
      "totalChargesInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "totalPaymentsInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "totalCreditsInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "agingBalances": [
        {
          "daysAged": "string",
          "amount": {
            "amount": 0,
            "currency": "string"
          }
        }
      ],
      "oldestCredit": {
        "creditAmount": {
          "amount": 0,
          "currency": "string"
        },
        "creditDate": "2018-09-11T18:06:35Z"
      },
      "collectionLetters": [
        "string"
      ],
      "lastStatementDate": "2018-09-11",
      "currentFloorLimit": {
        "baseLimit": {
          "amount": 0,
          "currency": "string"
        },
        "highCostLimit": {
          "amount": 0,
          "currency": "string"
        }
      },
      "personalCeilingLimit": {
        "amount": 0,
        "currency": "string"
      },
      "debtThresholdExceededAsOf": "2018-09-11",
      "creditorEvents": [
        {
          "effectiveDateTime": "2018-09-11T18:06:35Z",
          "value": "string"
        }
      ],
      "collectionAgencies": [
        {
          "name": "string",
          "trackingIdentifier": "string",
          "sentToCollectionAgencyDate": "2018-09-11T18:06:35Z",
          "amount": {
            "amount": 0,
            "currency": "string"
          },
          "collectionStatus": {
            "code": "string",
            "name": "string",
            "description": "string"
          }
        }
      ],
      "status": {
        "effectiveDateTime": "2018-09-11T18:06:35Z",
        "value": "string"
      },
      "storeKeySet": {
        "primaryKey": {
          "storeName": "string",
          "keyName": "string",
          "keyComponents": [
            {
              "name": "string",
              "value": "string"
            }
          ],
          "status": {
            "effectiveDateTime": "2018-09-11T18:06:35Z",
            "value": "string"
          }
        },
        "secondaryKeys" : [
            {
                "storeName" : "HomeDelivery",
                "keyName" : "AGN",
                "keyComponents" : [
                    {
                        "name" : "INDIVIDUAL_AGN_ID",
                        ${agnValue}
                    }
                ]
            },
            {
                "storeName" : "HomeDelivery",
                "keyName" : "C-M-G",
                "keyComponents" : [
                    {
                        "name" : "CustomerNumber",
                        ${customerNumberVal}
                    },
                    {
                        "name" : "MailGroup",
                        ${mailGrpValue}
                    },
                    {
                        "name" : "SubGroup",
                        ${subGroupValue}
                    }
                ]
            },
            {
                "storeName" : "HomeDelivery",
                "keyName" : "M",
                "keyComponents" : [
                    {
                        "name" : "MembershipId",
                        ${membershipIdVal}
                    }
                ]
            }
        ]
      }
    }
    """

    Given message pfaFullPOSTResponse
    And <pfaFullPOSTResponse> header Content-Type is "@startsWith('application/json;charset=utf-8')@"
    And <pfaFullPOSTResponse> header citrus_http_status_code is "201"
    And <pfaFullPOSTResponse> header citrus_http_reason_phrase is "CREATED"
    And <pfaFullPOSTResponse> payload is
    """
    {
      "resourceId": "@variable('resourceId')@",
      "createdDateTime": "@variable('createdDateTime')@",
      "updatedDateTime": "@variable('updatedDateTime')@",
      "accountHolder": {
           ${personResourceId}
      },
      "currentBalance": {
        "amount": 0,
        "currency": "string"
      },
      "totalChargesInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "totalPaymentsInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "totalCreditsInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "agingBalances": [
        {
          "daysAged": "string",
          "amount": {
            "amount": 0,
            "currency": "string"
          }
        }
      ],
      "oldestCredit": {
        "creditAmount": {
          "amount": 0,
          "currency": "string"
        },
        "creditDate": "2018-09-11T18:06:35Z"
      },
      "collectionLetters": [
        "string"
      ],
      "lastStatementDate": "2018-09-11",
      "currentFloorLimit": {
        "baseLimit": {
          "amount": 0,
          "currency": "string"
        },
        "highCostLimit": {
          "amount": 0,
          "currency": "string"
        }
      },
      "personalCeilingLimit": {
        "amount": 0,
        "currency": "string"
      },
      "debtThresholdExceededAsOf": "2018-09-11",
      "creditorEvents": [
        {
          "effectiveDateTime": "2018-09-11T18:06:35Z",
          "value": "string"
        }
      ],
      "collectionAgencies": [
        {
          "relavitevId": "@variable('relavitevId')@",
          "name": "string",
          "trackingIdentifier": "string",
          "sentToCollectionAgencyDate": "2018-09-11T18:06:35Z",
          "amount": {
            "amount": 0,
            "currency": "string"
          },
          "collectionStatus": {
            "code": "string",
            "name": "string",
            "description": "string"
          }
        }
      ],
      "status": {
        "effectiveDateTime": "2018-09-11T18:06:35Z",
        "value": "string"
      },
      "storeKeySet" : {
            "primaryKey" : {
                "storeName" : "string",
                "keyName" : "string",
                "keyComponents" : [
                    {
                        "name" : "string",
                        "value" : "string"
                    }
                ],
                "status" : {
                    "effectiveDateTime" : "2018-09-11T18:06:35Z",
                    "value" : "string"
                }
            },
            "secondaryKeys" : [
                {
                    "storeName" : "HomeDelivery",
                    "keyName" : "AGN",
                    "keyComponents" : [
                        {
                            "name" : "INDIVIDUAL_AGN_ID",
                            ${agnValue}
                        }
                    ]
                },
                {
                    "storeName" : "HomeDelivery",
                    "keyName" : "C-M-G",
                    "keyComponents" : [
                        {
                            "name" : "CustomerNumber",
                            ${customerNumberVal}
                        },
                        {
                            "name" : "MailGroup",
                            ${mailGrpValue}
                        },
                        {
                            "name" : "SubGroup",
                            ${subGroupValue}
                        }
                    ]
                },
                {
                    "storeName" : "HomeDelivery",
                    "keyName" : "M",
                    "keyComponents" : [
                        {
                            "name" : "MembershipId",
                            ${membershipIdVal}
                        }
                    ]
                }
            ]
        },
      "_links": {
        "self": {
         "href": "@variable('href')@"
        }
      }
    }
    """

    Given message pfaFullGetResponse
    And <pfaFullGetResponse> header Content-Type is "@startsWith('application/json;charset=utf-8')@"
    And <pfaFullGetResponse> header citrus_http_status_code is "${httpCode}"
    And <pfaFullGetResponse> header citrus_http_reason_phrase is "${httpMessage}"
    And <pfaFullGetResponse> payload is
    """
    [
      {"resourceId": "@variable('resourceId')@",
        "createdDateTime": "@variable('createdDateTime')@",
        "updatedDateTime": "@variable('updatedDateTime')@",
      "accountHolder": {
           ${personResourceId}
      },
      "currentBalance": {
        "amount": 0,
        "currency": "string"
      },
      "totalChargesInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "totalPaymentsInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "totalCreditsInProcess": {
        "amount": 0,
        "currency": "string"
      },
      "agingBalances": [
        {
          "daysAged": "string",
          "amount": {
            "amount": 0,
            "currency": "string"
          }
        }
      ],
      "oldestCredit": {
        "creditAmount": {
          "amount": 0,
          "currency": "string"
        },
        "creditDate": "2018-09-11T18:06:35Z"
      },
      "collectionLetters": [
        "string"
      ],
      "lastStatementDate": "2018-09-11",
      "currentFloorLimit": {
        "baseLimit": {
          "amount": 0,
          "currency": "string"
        },
        "highCostLimit": {
          "amount": 0,
          "currency": "string"
        }
      },
      "personalCeilingLimit": {
        "amount": 0,
        "currency": "string"
      },
      "debtThresholdExceededAsOf": "2018-09-11",
      "creditorEvents": [
        {
          "effectiveDateTime": "2018-09-11T18:06:35Z",
          "value": "string"
        }
      ],
      "collectionAgencies": [
        {
          "relavitevId": "@variable('relavitevId')@",
          "name": "string",
          "trackingIdentifier": "string",
          "sentToCollectionAgencyDate": "2018-09-11T18:06:35Z",
          "amount": {
            "amount": 0,
            "currency": "string"
          },
          "collectionStatus": {
            "code": "string",
            "name": "string",
            "description": "string"
          }
        }
      ],
      "status": {
        "effectiveDateTime": "2018-09-11T18:06:35Z",
        "value": "string"
      },
      "storeKeySet" : {
            "primaryKey" : {
                "storeName" : "string",
                "keyName" : "string",
                "keyComponents" : [
                    {
                        "name" : "string",
                        "value" : "string"
                    }
                ],
                "status" : {
                    "effectiveDateTime" : "2018-09-11T18:06:35Z",
                    "value" : "string"
                }
            },
            "secondaryKeys" : [
                {
                    "storeName" : "HomeDelivery",
                    "keyName" : "AGN",
                    "keyComponents" : [
                        {
                            "name" : "INDIVIDUAL_AGN_ID",
                            ${agnValue}
                        }
                    ]
                },
                {
                    "storeName" : "HomeDelivery",
                    "keyName" : "C-M-G",
                    "keyComponents" : [
                        {
                            "name" : "CustomerNumber",
                            ${customerNumberVal}
                        },
                        {
                            "name" : "MailGroup",
                            ${mailGrpValue}
                        },
                        {
                            "name" : "SubGroup",
                            ${subGroupValue}
                        }
                    ]
                },
                {
                    "storeName" : "HomeDelivery",
                    "keyName" : "M",
                    "keyComponents" : [
                        {
                            "name" : "MembershipId",
                            ${membershipIdVal}
                        }
                    ]
                }
            ]
        },
          "links": [
          {
            "rel": "self",
            "href": "@variable('href')@"
          }
        ]
      }
    ]
    """


    Given message pfaGetErrorResponse
    And <pfaGetErrorResponse> header Content-Type is "@startsWith('application/json;charset=utf-8')@"
    And <pfaGetErrorResponse> header citrus_http_status_code is "${hTTPErrorCode}"
    And <pfaGetErrorResponse> header citrus_http_reason_phrase is "${hTTPErrorMessage}"
    And <pfaGetErrorResponse> payload is
    """

    """


    Given message kafkaLatestTopicInserResponse
    And <kafkaLatestTopicInserResponse> payload is
    """
    {
        "messageVersion":1,
        "header":{
            "operation":"INSERT",
            "originalSource":"${headerOriginalSource}",
            "publisher":"${headerPublisher}",
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
              "currentBalance": {
                "amount": 0,
                "currency": "string"
              },
              "totalChargesInProcess": {
                "amount": 0,
                "currency": "string"
              },
              "totalPaymentsInProcess": {
                "amount": 0,
                "currency": "string"
              },
              "totalCreditsInProcess": {
                "amount": 0,
                "currency": "string"
              },
              "agingBalances": [
                {
                  "daysAged": "string",
                  "amount": {
                    "amount": 0,
                    "currency": "string"
                  }
                }
              ],
              "oldestCredit": {
                "creditAmount": {
                  "amount": 0,
                  "currency": "string"
                },
                "creditDate": "2018-09-11T18:06:35Z"
              },
              "collectionLetters": [
                "string"
              ],
              "lastStatementDate": "2018-09-11",
              "currentFloorLimit": {
                "baseLimit": {
                  "amount": 0,
                  "currency": "string"
                },
                "highCostLimit": {
                  "amount": 0,
                  "currency": "string"
                }
              },
              "personalCeilingLimit": {
                "amount": 0,
                "currency": "string"
              },
              "debtThresholdExceededAsOf": "2018-09-11",
              "creditorEvents": [
                {
                  "effectiveDateTime": "2018-09-11T18:06:35Z",
                  "value": "string"
                }
              ],
              "collectionAgencies": [
                {
                  "relavitevId": "@variable('relavitevId')@",
                  "name": "string",
                  "trackingIdentifier": "string",
                  "sentToCollectionAgencyDate": "2018-09-11T18:06:35Z",
                  "amount": {
                    "amount": 0,
                    "currency": "string"
                  },
                  "collectionStatus": {
                    "code": "string",
                    "name": "string",
                    "description": "string"
                  }
                }
              ],
              "status": {
                "effectiveDateTime": "2018-09-11T18:06:35Z",
                "value": "string"
              },
              "storeKeySet" : {
                    "primaryKey" : {
                        "storeName" : "string",
                        "keyName" : "string",
                        "keyComponents" : [
                            {
                                "name" : "string",
                                "value" : "string"
                            }
                        ],
                        "status" : {
                            "effectiveDateTime" : "2018-09-11T18:06:35Z",
                            "value" : "string"
                        }
                    },
                    "secondaryKeys" : [
                        {
                            "storeName" : "HomeDelivery",
                            "keyName" : "AGN",
                            "keyComponents" : [
                                {
                                    "name" : "INDIVIDUAL_AGN_ID",
                                    ${agnValue}
                                }
                            ]
                        },
                        {
                            "storeName" : "HomeDelivery",
                            "keyName" : "C-M-G",
                            "keyComponents" : [
                                {
                                    "name" : "CustomerNumber",
                                    ${customerNumberVal}
                                },
                                {
                                    "name" : "MailGroup",
                                    ${mailGrpValue}
                                },
                                {
                                    "name" : "SubGroup",
                                    ${subGroupValue}
                                }
                            ]
                        },
                        {
                            "storeName" : "HomeDelivery",
                            "keyName" : "M",
                            "keyComponents" : [
                                {
                                    "name" : "MembershipId",
                                    ${membershipIdVal}
                                }
                            ]
                        }
                    ]
                },
              "links": []
                }
    }
    """

    Given message kafkaChangeTopicInsertResponse
    And <kafkaChangeTopicInsertResponse> payload is
    """
    {
        "messageVersion":1,
        "header":{
            "operation":"INSERT",
            "originalSource":"${headerOriginalSource}",
            "publisher":"${headerPublisher}",
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
              "currentBalance": {
                "amount": 0,
                "currency": "string"
              },
              "totalChargesInProcess": {
                "amount": 0,
                "currency": "string"
              },
              "totalPaymentsInProcess": {
                "amount": 0,
                "currency": "string"
              },
              "totalCreditsInProcess": {
                "amount": 0,
                "currency": "string"
              },
              "agingBalances": [
                {
                  "daysAged": "string",
                  "amount": {
                    "amount": 0,
                    "currency": "string"
                  }
                }
              ],
              "oldestCredit": {
                "creditAmount": {
                  "amount": 0,
                  "currency": "string"
                },
                "creditDate": "2018-09-11T18:06:35Z"
              },
              "collectionLetters": [
                "string"
              ],
              "lastStatementDate": "2018-09-11",
              "currentFloorLimit": {
                "baseLimit": {
                  "amount": 0,
                  "currency": "string"
                },
                "highCostLimit": {
                  "amount": 0,
                  "currency": "string"
                }
              },
              "personalCeilingLimit": {
                "amount": 0,
                "currency": "string"
              },
              "debtThresholdExceededAsOf": "2018-09-11",
              "creditorEvents": [
                {
                  "effectiveDateTime": "2018-09-11T18:06:35Z",
                  "value": "string"
                }
              ],
              "collectionAgencies": [
                {
                  "relavitevId": "@variable('relavitevId')@",
                  "name": "string",
                  "trackingIdentifier": "string",
                  "sentToCollectionAgencyDate": "2018-09-11T18:06:35Z",
                  "amount": {
                    "amount": 0,
                    "currency": "string"
                  },
                  "collectionStatus": {
                    "code": "string",
                    "name": "string",
                    "description": "string"
                  }
                }
              ],
              "status": {
                "effectiveDateTime": "2018-09-11T18:06:35Z",
                "value": "string"
              },
              "storeKeySet" : {
                    "primaryKey" : {
                        "storeName" : "string",
                        "keyName" : "string",
                        "keyComponents" : [
                            {
                                "name" : "string",
                                "value" : "string"
                            }
                        ],
                        "status" : {
                            "effectiveDateTime" : "2018-09-11T18:06:35Z",
                            "value" : "string"
                        }
                    },
                    "secondaryKeys" : [
                        {
                            "storeName" : "HomeDelivery",
                            "keyName" : "AGN",
                            "keyComponents" : [
                                {
                                    "name" : "INDIVIDUAL_AGN_ID",
                                    ${agnValue}
                                }
                            ]
                        },
                        {
                            "storeName" : "HomeDelivery",
                            "keyName" : "C-M-G",
                            "keyComponents" : [
                                {
                                    "name" : "CustomerNumber",
                                    ${customerNumberVal}
                                },
                                {
                                    "name" : "MailGroup",
                                    ${mailGrpValue}
                                },
                                {
                                    "name" : "SubGroup",
                                    ${subGroupValue}
                                }
                            ]
                        },
                        {
                            "storeName" : "HomeDelivery",
                            "keyName" : "M",
                            "keyComponents" : [
                                {
                                    "name" : "MembershipId",
                                    ${membershipIdVal}
                                }
                            ]
                        }
                    ]
                },
              "links": []

            }
          }
        }
    """

  @DEV
  @API
  Scenario: 1 Gets empty response for PersonFinancialAccount not present in case the search criteria not found for AGN, MembershipId, Customer, Customer-MailGroup-SubGroup, Person Resource Id
    Given variables
      | httpCode            | 200                 |
      | httpMessage         | OK                  |
      | individualAGNQry    | "1"                 |
      | membershipIdQry     | "2"                 |
      | customerNumberQry   | "3"                 |
      | mailGroupQry        | "4"                 |
      | subGroupQry         | "5"                 |
      | personResourceIdQry | citrus:randomUUID() |
      | tenantId            | 12345678            |
    #Search by a new Person Resource ID
    When <pfaClient> sends message <pfaGetByPersonResourceId>
    Then <pfaClient> should receive JSON message <pfaGetEmptyResponse>

    #Search by invalid Individual AGN
    When <pfaClient> sends message <pfaGetByIndividualAGN>
    Then <pfaClient> should receive JSON message <pfaGetEmptyResponse>

    #Search by invalid Membership Id
    When <pfaClient> sends message <pfaGetByMembershipId>
    Then <pfaClient> should receive JSON message <pfaGetEmptyResponse>

    #Search by invalid Customer Number
    When <pfaClient> sends message <pfaGetByCustomerNumber>
    Then <pfaClient> should receive JSON message <pfaGetEmptyResponse>

    #Search by invalid Customer, MailGroup, SubGroup
    When <pfaClient> sends message <pfaGetByCMG>
    Then <pfaClient> should receive JSON message <pfaGetEmptyResponse>

  @DEV
  @API
  Scenario:2 Search person financial account with full details when search criteria found for AGN, MembershipId, Customer, Customer-MailGroup-SubGroup, Person Resource Id

    Given variables
      | id1                  | citrus:randomUUID()            |
      | personResourceId     | "personResourceId":"${id1}"    |
      | personResourceIdQry  | ${id1}                         |
      | agn                  | citrus:randomNumber(10)        |
      | agnValue             | "value":"${agn}"               |
      | customerNumber       | citrus:randomString(10, UPPER) |
      | customerNumberVal    | "value":"${customerNumber}"    |
      | mailGroup            | citrus:randomString(3, UPPER)  |
      | mailGrpValue         | "value":"${mailGroup}"         |
      | subGroup             | citrus:randomString(4, UPPER)  |
      | subGroupValue        | "value":"${subGroup}"          |
      | membershipId         | citrus:randomNumber(10)        |
      | membershipIdVal      | "value":"${membershipId}"      |
      | httpCode             | 200                            |
      | httpMessage          | OK                             |
      | individualAGNQry     | ${agn}                         |
      | membershipIdQry      | ${membershipId}                |
      | customerNumberQry    | ${customerNumber}              |
      | mailGroupQry         | ${mailGroup}                   |
      | subGroupQry          | ${subGroup}                    |
      | headerOriginalSource | PEPPFACT                       |
      | headerPublisher      | PEPPFACT                       |
      | tenantId             | 12345678                       |
    #Inserting a record to search
    When <pfaClient> sends message <pfaFullPOSTRequest>
    And <pfaClient> should receive JSON message <pfaFullPOSTResponse>

    #Search by Person Resource ID
    When <pfaClient> sends message <pfaGetByPersonResourceId>
    Then <pfaClient> should receive JSON message <pfaFullGetResponse>

    #Search by Individual AGN
    When <pfaClient> sends message <pfaGetByIndividualAGN>
    Then <pfaClient> should receive JSON message <pfaFullGetResponse>

    #Search by Membership Id
    When <pfaClient> sends message <pfaGetByMembershipId>
    Then <pfaClient> should receive JSON message <pfaFullGetResponse>

    #Search by Customer Number
    When <pfaClient> sends message <pfaGetByCustomerNumber>
    Then <pfaClient> should receive JSON message <pfaFullGetResponse>

    #Search by Customer, MailGroup, SubGroup
    When <pfaClient> sends message <pfaGetByCMG>
    Then <pfaClient> should receive JSON message <pfaFullGetResponse>

    #Verifying the messages posted to Latest topic
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicInserResponse>

    #Verifying the messages posted to Change topic
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicInsertResponse>

  @DEV
  Scenario:3 Gets 400 response for invalid person resource ID
    Given variables
      | personResourceIdQry | 5a4379c4-9f66-05bd-40a |
      | hTTPErrorCode       | 400                    |
      | hTTPErrorMessage    | BAD_REQUEST            |
      | tenantId            | 12345678               |
    When <pfaClient> sends message <pfaGetByPersonResourceId>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>

  @DEV
  Scenario:4 Gets 400 response for person resource ID is null
    Given variables
      | personResourceIdQry |             |
      | hTTPErrorCode       | 400         |
      | hTTPErrorMessage    | BAD_REQUEST |
      | tenantId            | 12345678    |
    When <pfaClient> sends message <pfaGetByPersonResourceId>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>

  @DEV
  Scenario:5 Gets 400 response for CMG when mailGroup, subGroup and no customer number provided
    Given variables
      | mailGroupQry      | "MAIL_GRP"  |
      | subGroupQry       | "SUB_GRP"   |
      | customerNumberQry |             |
      | hTTPErrorCode     | 400         |
      | hTTPErrorMessage  | BAD_REQUEST |
      | tenantId          | 12345678    |
    When <pfaClient> sends message <pfaGetByCMG>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>

  @DEV
  Scenario:6 Gets 400 response for CMG when mailGroup provided and no customer number provided
    Given variables
      | mailGroupQry      | "MAIL_GRP"  |
      | subGroupQry       |             |
      | customerNumberQry |             |
      | hTTPErrorCode     | 400         |
      | hTTPErrorMessage  | BAD_REQUEST |
      | tenantId          | 12345678    |
    When <pfaClient> sends message <pfaGetByCMG>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>

  @DEV
  Scenario:7 Gets 400 response for CMG when subGroup provided and no customer number provided
    Given variables
      | mailGroupQry      |             |
      | subGroupQry       | "SUB_GRP"   |
      | customerNumberQry |             |
      | hTTPErrorCode     | 400         |
      | hTTPErrorMessage  | BAD_REQUEST |
      | tenantId          | 12345678    |
    When <pfaClient> sends message <pfaGetByCMG>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>

  @DEV
  Scenario:8 Gets 400 response if no search criteria is provided
    Given variables
      | hTTPErrorCode    | 400         |
      | hTTPErrorMessage | BAD_REQUEST |
      | tenantId         | 12345678    |
    When <pfaClient> sends message <pfaGetByNulls>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>

