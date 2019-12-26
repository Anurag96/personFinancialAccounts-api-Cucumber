Feature: Search Person financial Account information by resource id

  Background:

    Given message pfaGetRequest
    And <pfaGetRequest> header Content-Type is "application/json"
    And <pfaGetRequest> header Tenantid is "${tenantId}"
    And <pfaGetRequest> header Transactionid is "${globalTransactionId}"
    And <pfaGetRequest> header citrus_http_method is "GET"
    And <pfaGetRequest> header citrus_request_path is "/${resourceId}"


    Given message pfaGetErrorResponse
    And <pfaGetErrorResponse> header citrus_http_status_code is "${hTTPErrorCode}"
    And <pfaGetErrorResponse> header citrus_http_reason_phrase is "${hTTPErrorMessage}"
    And <pfaGetErrorResponse> payload is
				"""

                """

    Given message pfaFullPOSTRequest
    And <pfaFullPOSTRequest> header Content-Type is "application/json"
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
    And <pfaFullPOSTResponse> header Content-Type is "@startsWith('application/json')@"
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

    Given message pfaGETResponse
    And <pfaGETResponse> header Content-Type is "@startsWith('application/json')@"
    And <pfaGETResponse> header citrus_http_status_code is "200"
    And <pfaGETResponse> header citrus_http_reason_phrase is "OK"
    And <pfaGETResponse> payload is
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
  Scenario:1 Search person financial account information by a valid Resource Id

    Given variables
      | id1                  | citrus:randomUUID()            |
      | personResourceId     | "personResourceId":"${id1}"    |
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
      | headerOriginalSource | PEPPFACT                       |
      | headerPublisher      | PEPPFACT                       |
      | tenantId             | 12345678                       |

    When <pfaClient> sends message <pfaFullPOSTRequest>
    And <pfaClient> should receive JSON message <pfaFullPOSTResponse>

    #Verifying the messages posted to Latest topic
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicInserResponse>

    #Verifying the messages posted to Change topic
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicInsertResponse>

#    When <pfaClient> sends message <pfaGetRequest>
#    And <pfaClient> should receive JSON message <pfaGETResponse>

  @DEV
  Scenario:2 Gets 400 response for invalid resource ID

    Given variables
      | resourceId       | 5a4379c4-9f66-05bd-40a |
      | hTTPErrorCode    | 400                    |
      | hTTPErrorMessage | BAD_REQUEST            |
      | tenantId         | 12345678               |

    When <pfaClient> sends message <pfaGetRequest>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>


  @DEV
  Scenario:3 Gets 404 response for invalid resource id
    Given variables
      | resourceId       | d3aa88e2-c754-41e0-8ba6-4198a34aa0a2 |
      | hTTPErrorCode    | 404                                  |
      | hTTPErrorMessage | NOT_FOUND                            |
      | tenantId         | 12345678                             |

    When <pfaClient> sends message <pfaGetRequest>
    Then <pfaClient> should receive JSON message <pfaGetErrorResponse>