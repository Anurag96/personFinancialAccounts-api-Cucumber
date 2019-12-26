Feature: Testing Kafka Sync to Latest

  Background:
    Given message kafkaInsertRequest
    And <kafkaInsertRequest> payload is
    """
    {
       "processorError":null,
       "context":null,
       "messageVersion":1,
       "header":{
          "parentId":null,
          "operation":"INSERT",
          "payloadType":null,
          "originalSource":"${headerOriginalSource}",
          "sourceDateTime":"${headerSourceDateTime}",
          "publisher":"${headerPublisher}",
          "publisherType":null,
          "transactionId":"${transactionId}",
          "tenantId":${tenantId},
          "requestId":null
       },
       "payload":{
          "resourceId": "${resourceId}",
         "accountHolder": {
              ${personResourceId}
          },
          "createdDateTime":"2019-12-11T18:06:35+00:00",
        "updatedDateTime":"2019-12-11T18:06:35+00:00",
          "currentBalance":{
             "amount":${currentBalanceAmount},
             "currency":"${currency}"
          },
          "totalChargesInProcess":{
             "amount": ${totalChargesInProcessAmount},
             "currency":"${currency}"
          },
          "totalPaymentsInProcess":null,
          "totalCreditsInProcess":null,
          "agingBalances":[
             {
                "daysAged":"${agingBalances1DaysAged}",
                "amount":{
                   "amount":${agingBalances1DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances2DaysAged}",
                "amount":{
                   "amount":${agingBalances2DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances3DaysAged}",
                "amount":{
                   "amount":${agingBalances3DaysAgedAmount},
                   "currency":"${currency}"
                }
             }
          ],
          "oldestCredit":{
             "creditAmount":{
                "amount":${oldestCreditCreditAmount},
                "currency":"${currency}"
             },
             "creditDate":null
          },
          "collectionLetters":null,
          "lastStatementDate":null,
          "currentFloorLimit":{
             "baseLimit":{
                "amount":${currentFloorLimitBaseLimitAmount},
                "currency":"${currency}"
             },
             "highCostLimit":{
                "amount":${currentFloorLimitHighCostLimitAmount},
                "currency":"${currency}"
             }
          },
          "personalCeilingLimit":null,
          "debtThresholdExceededAsOf":null,
          "creditorEvents":null,
          "collectionAgencies":null,
          "extendedPaymentPlanParticipant":null,
          "status":{
             "effectiveDateTime":"2019-12-11T18:06:35+00:00",
             "value":"ACTIVE"
          },
          "storeKeySet":{
             "primaryKey":null,
             "secondaryKeys":[
                {
                   "storeName":"HomeDelivery",
                   "keyName":"C-M-G",
                   "keyComponents":[
                      {
                         "name":"CustomerNumber",
                         "value":"${customerNumber}"
                      },
                      {
                         "name":"MailGroup",
                         "value":"${mailGroup}"
                      },
                      {
                         "name":"SubGroup",
                         "value":"${subGroup}"
                      }
                   ],
                   "status":null
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"AGN",
                   "keyComponents":[
                      {
                         "name":"Individual-AGN-ID",
                         "value":"0"
                      }
                   ],
                   "status":null
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"M",
                   "keyComponents":[
                      {
                         "name":"MembershipId",
                         "value":"${membershipId}"
                      }
                   ],
                   "status":null
                }
             ]
          }
       }
    }
    """

    Given message kafkaLatestTopicInsertResponse
    And <kafkaLatestTopicInsertResponse> payload is
    """
    {
        "messageVersion":1,
        "header":{
            "operation":"INSERT",
            "originalSource":"${headerOriginalSource}",
            "sourceDateTime":"${headerSourceDateTime}",
            "publisher":"${headerPublisher}",
            "transactionId":"${transactionId}",
            "tenantId":${tenantId}
        },
        "payload":{
            "resourceId": "@variable('resourceId')@",
            "updatedDateTime":"@matchesDatePattern('yyyy-MM-dd')@",
            "currentBalance":{
                "amount":${currentBalanceAmount},
                "currency":"${currency}"
            },
            "totalChargesInProcess":{
                "amount": ${totalChargesInProcessAmount},
                "currency":"${currency}"
            },
            "agingBalances":[
                {
                    "daysAged":"${agingBalances1DaysAged}",
                    "amount":{
                        "amount":${agingBalances1DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances2DaysAged}",
                    "amount":{
                        "amount": ${agingBalances2DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances3DaysAged}",
                    "amount":{
                        "amount":${agingBalances3DaysAgedAmount},
                        "currency":"${currency}"
                    }
                }
            ],
            "oldestCredit":{
                "creditAmount":{
                    "amount":${oldestCreditCreditAmount},
                    "currency":"${currency}"
                }
            },
            "currentFloorLimit":{
                "baseLimit":{
                    "amount":${currentFloorLimitBaseLimitAmount},
                    "currency":"${currency}"
                },
                "highCostLimit":{
                    "amount":${currentFloorLimitHighCostLimitAmount},
                    "currency":"${currency}"
                }
            },
          "status":{
             "effectiveDateTime":"2019-12-11T18:06:35Z",
             "value":"ACTIVE"
          },
            "storeKeySet":{
                "secondaryKeys":[
                    {
                        "storeName":"HomeDelivery",
                        "keyName":"C-M-G",
                        "keyComponents":[
                            {
                                "name":"CustomerNumber",
                                "value":"@variable('customerNumber')@"
                            },
                            {
                                "name":"MailGroup",
                                "value":"@variable('mailGroup')@"
                            },
                            {
                                "name":"SubGroup",
                                "value":"@variable('subGroup')@"
                            }
                        ]
                    },
                    {
                        "storeName":"HomeDelivery",
                        "keyName":"AGN",
                        "keyComponents":[
                            {
                                "name":"Individual-AGN-ID",
                                "value":"0"
                            }
                        ]
                    },
                    {
                        "storeName":"HomeDelivery",
                        "keyName":"M",
                        "keyComponents":[
                            {
                                "name":"MembershipId",
                                "value":"@variable('membershipId')@"
                            }
                        ]
                    }
                ]
            },
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
            "sourceDateTime":"${headerSourceDateTime}",
            "publisher":"${headerPublisher}",
            "transactionId":"${transactionId}",
            "tenantId":${tenantId}
        },
        "payload":{
          "data":{
            "resourceId": "@variable('resourceId')@",
            "createdDateTime": "@matchesDatePattern('yyyy-MM-dd')@",
            "updatedDateTime":"@matchesDatePattern('yyyy-MM-dd')@",
            "currentBalance":{
                "amount":${currentBalanceAmount},
                "currency":"${currency}"
            },
            "totalChargesInProcess":{
                "amount": ${totalChargesInProcessAmount},
                "currency":"${currency}"
            },
            "agingBalances":[
                {
                    "daysAged":"${agingBalances1DaysAged}",
                    "amount":{
                        "amount":${agingBalances1DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances2DaysAged}",
                    "amount":{
                        "amount": ${agingBalances2DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances3DaysAged}",
                    "amount":{
                        "amount":${agingBalances3DaysAgedAmount},
                        "currency":"${currency}"
                    }
                }
            ],
            "oldestCredit":{
                "creditAmount":{
                    "amount":${oldestCreditCreditAmount},
                    "currency":"${currency}"
                }
            },
            "currentFloorLimit":{
                "baseLimit":{
                    "amount":${currentFloorLimitBaseLimitAmount},
                    "currency":"${currency}"
                },
                "highCostLimit":{
                    "amount":${currentFloorLimitHighCostLimitAmount},
                    "currency":"${currency}"
                }
            },
          "status":{
             "effectiveDateTime":"2019-12-11T18:06:35Z",
             "value":"ACTIVE"
          },
            "storeKeySet":{
                "secondaryKeys":[
                    {
                        "storeName":"HomeDelivery",
                        "keyName":"C-M-G",
                        "keyComponents":[
                            {
                                "name":"CustomerNumber",
                                "value":"@variable('customerNumber')@"
                            },
                            {
                                "name":"MailGroup",
                                "value":"@variable('mailGroup')@"
                            },
                            {
                                "name":"SubGroup",
                                "value":"@variable('subGroup')@"
                            }
                        ]
                    },
                    {
                        "storeName":"HomeDelivery",
                        "keyName":"AGN",
                        "keyComponents":[
                            {
                                "name":"Individual-AGN-ID",
                                "value":"0"
                            }
                        ]
                    },
                    {
                        "storeName":"HomeDelivery",
                        "keyName":"M",
                        "keyComponents":[
                            {
                                "name":"MembershipId",
                                "value":"@variable('membershipId')@"
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

    Given message kafkaUpdateRequest
    And <kafkaUpdateRequest> payload is
    """
    {
       "processorError":null,
       "context":null,
       "messageVersion":1,
       "header":{
          "parentId":null,
          "operation":"UPDATE",
          "payloadType":null,
          "originalSource":"${headerOriginalSource}",
          "sourceDateTime":"${headerSourceDateTime}",
          "publisher":"${headerPublisher}",
          "publisherType":null,
          "transactionId":"${transactionId}",
          "tenantId":${tenantId},
          "requestId":null
       },
       "payload":{
          "resourceId": "${resourceId}",
         "accountHolder": {
              ${personResourceId}
          },
        "createdDateTime":"2019-12-11T18:06:35+00:00",
        "updatedDateTime":"2019-12-11T18:06:35+00:00",
          "currentBalance":{
             "amount":${newCurrentBalanceAmount},
             "currency":"${currency}"
          },
          "totalChargesInProcess":{
             "amount": ${totalChargesInProcessAmount},
             "currency":"${currency}"
          },
          "totalPaymentsInProcess":null,
          "totalCreditsInProcess":null,
          "agingBalances":[
             {
                "daysAged":"${agingBalances1DaysAged}",
                "amount":{
                   "amount":${agingBalances1DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances2DaysAged}",
                "amount":{
                   "amount":${agingBalances2DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances3DaysAged}",
                "amount":{
                   "amount":${agingBalances3DaysAgedAmount},
                   "currency":"${currency}"
                }
             }
          ],
          "oldestCredit":{
             "creditAmount":{
                "amount":${oldestCreditCreditAmount},
                "currency":"${currency}"
             },
             "creditDate":null
          },
          "collectionLetters":null,
          "lastStatementDate":null,
          "currentFloorLimit":{
             "baseLimit":{
                "amount":${currentFloorLimitBaseLimitAmount},
                "currency":"${currency}"
             },
             "highCostLimit":{
                "amount":${currentFloorLimitHighCostLimitAmount},
                "currency":"${currency}"
             }
          },
          "personalCeilingLimit":null,
          "debtThresholdExceededAsOf":null,
          "creditorEvents":null,
          "collectionAgencies":null,
          "extendedPaymentPlanParticipant":null,
          "status":{
             "effectiveDateTime":"2019-12-12T18:06:35+00:00",
             "value":"ON-HOLD"
          },
          "storeKeySet":{
             "primaryKey":null,
             "secondaryKeys":[
                {
                   "storeName":"HomeDelivery",
                   "keyName":"C-M-G",
                   "keyComponents":[
                      {
                         "name":"CustomerNumber",
                         "value":"${customerNumber}"
                      },
                      {
                         "name":"MailGroup",
                         "value":"${mailGroup}"
                      },
                      {
                         "name":"SubGroup",
                         "value":"${subGroup}"
                      }
                   ],
                   "status":null
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"AGN",
                   "keyComponents":[
                      {
                         "name":"Individual-AGN-ID",
                         "value":"0"
                      }
                   ],
                   "status":null
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"M",
                   "keyComponents":[
                      {
                         "name":"MembershipId",
                         "value":"${membershipId}"
                      }
                   ],
                   "status":null
                }
             ]
          }
       }
    }
    """

    Given message kafkaLatestTopicUpdateResponse
    And <kafkaLatestTopicUpdateResponse> payload is
    """
    {
        "messageVersion":1,
        "header":{
            "operation":"UPDATE",
            "originalSource":"${headerOriginalSource}",
            "sourceDateTime":"${headerSourceDateTime}",
            "publisher":"${headerPublisher}",
            "transactionId":"${transactionId}",
            "tenantId":${tenantId}
        },
        "payload":{
            "resourceId": "${resourceId}",
            "updatedDateTime":"@matchesDatePattern('yyyy-MM-dd')@",
            "currentBalance":{
                "amount":${newCurrentBalanceAmount},
                "currency":"${currency}"
            },
            "totalChargesInProcess":{
                "amount": ${totalChargesInProcessAmount},
                "currency":"${currency}"
            },
            "agingBalances":[
                {
                    "daysAged":"${agingBalances1DaysAged}",
                    "amount":{
                        "amount":${agingBalances1DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances2DaysAged}",
                    "amount":{
                        "amount": ${agingBalances2DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances3DaysAged}",
                    "amount":{
                        "amount":${agingBalances3DaysAgedAmount},
                        "currency":"${currency}"
                    }
                }
            ],
            "oldestCredit":{
                "creditAmount":{
                    "amount":${oldestCreditCreditAmount},
                    "currency":"${currency}"
                }
            },
            "currentFloorLimit":{
                "baseLimit":{
                    "amount":${currentFloorLimitBaseLimitAmount},
                    "currency":"${currency}"
                },
                "highCostLimit":{
                    "amount":${currentFloorLimitHighCostLimitAmount},
                    "currency":"${currency}"
                }
            },
            "status":{
               "effectiveDateTime":"2019-12-12T18:06:35Z",
               "value":"ON-HOLD"
            },
            "storeKeySet":{
               "secondaryKeys":[
                  {
                     "storeName":"HomeDelivery",
                     "keyName":"C-M-G",
                     "keyComponents":[
                        {
                           "name":"CustomerNumber",
                           "value":"${customerNumber}"
                        },
                        {
                           "name":"MailGroup",
                           "value":"${mailGroup}"
                        },
                        {
                           "name":"SubGroup",
                           "value":"${subGroup}"
                        }
                     ]
                  },
                  {
                     "storeName":"HomeDelivery",
                     "keyName":"AGN",
                     "keyComponents":[
                        {
                           "name":"Individual-AGN-ID",
                           "value":"0"
                        }
                     ]
                  },
                  {
                     "storeName":"HomeDelivery",
                     "keyName":"M",
                     "keyComponents":[
                        {
                           "name":"MembershipId",
                           "value":"${membershipId}"
                        }
                     ]
                  }
               ]
            }
        }
    }
    """

    Given message kafkaChangeTopicUpdateResponse
    And <kafkaChangeTopicUpdateResponse> payload is
    """
     {
       "messageVersion":1,
        "header":{
            "operation":"UPDATE",
            "originalSource":"${headerOriginalSource}",
            "sourceDateTime":"${headerSourceDateTime}",
            "publisher":"${headerPublisher}",
            "transactionId":"${transactionId}",
            "tenantId":${tenantId}
        },
        "payload":{
            "beforeData":{
                "resourceId": "@variable('resourceId')@",
                "updatedDateTime":"@matchesDatePattern('yyyy-MM-dd')@",
                "currentBalance":{
                    "amount":${currentBalanceAmount},
                    "currency":"${currency}"
                },
                "totalChargesInProcess":{
                    "amount": ${totalChargesInProcessAmount},
                    "currency":"${currency}"
                },
                "agingBalances":[
                    {
                        "daysAged":"${agingBalances1DaysAged}",
                        "amount":{
                            "amount":${agingBalances1DaysAgedAmount},
                            "currency":"${currency}"
                        }
                    },
                    {
                        "daysAged":"${agingBalances2DaysAged}",
                        "amount":{
                            "amount": ${agingBalances2DaysAgedAmount},
                            "currency":"${currency}"
                        }
                    },
                    {
                        "daysAged":"${agingBalances3DaysAged}",
                        "amount":{
                            "amount":${agingBalances3DaysAgedAmount},
                            "currency":"${currency}"
                        }
                    }
                ],
                "oldestCredit":{
                    "creditAmount":{
                        "amount":${oldestCreditCreditAmount},
                        "currency":"${currency}"
                    }
                },
                "currentFloorLimit":{
                    "baseLimit":{
                        "amount":${currentFloorLimitBaseLimitAmount},
                        "currency":"${currency}"
                    },
                    "highCostLimit":{
                        "amount":${currentFloorLimitHighCostLimitAmount},
                        "currency":"${currency}"
                    }
                },
                "status":{
                   "effectiveDateTime":"2019-12-11T18:06:35Z",
                   "value":"ACTIVE"
                },
                "storeKeySet":{
                    "secondaryKeys":[
                        {
                            "storeName":"HomeDelivery",
                            "keyName":"C-M-G",
                            "keyComponents":[
                                {
                                    "name":"CustomerNumber",
                                    "value":"@variable('customerNumber')@"
                                },
                                {
                                    "name":"MailGroup",
                                    "value":"@variable('mailGroup')@"
                                },
                                {
                                    "name":"SubGroup",
                                    "value":"@variable('subGroup')@"
                                }
                            ]
                        },
                        {
                            "storeName":"HomeDelivery",
                            "keyName":"AGN",
                            "keyComponents":[
                                {
                                    "name":"Individual-AGN-ID",
                                    "value":"0"
                                }
                            ]
                        },
                        {
                            "storeName":"HomeDelivery",
                            "keyName":"M",
                            "keyComponents":[
                                {
                                    "name":"MembershipId",
                                    "value":"@variable('membershipId')@"
                                }
                            ]
                        }
                    ]
                }
            },
            "data":{
            "resourceId": "${resourceId}",
            "updatedDateTime":"@matchesDatePattern('yyyy-MM-dd')@",
            "currentBalance":{
                "amount":${newCurrentBalanceAmount},
                "currency":"${currency}"
            },
            "totalChargesInProcess":{
                "amount": ${totalChargesInProcessAmount},
                "currency":"${currency}"
            },
            "agingBalances":[
                {
                    "daysAged":"${agingBalances1DaysAged}",
                    "amount":{
                        "amount":${agingBalances1DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances2DaysAged}",
                    "amount":{
                        "amount": ${agingBalances2DaysAgedAmount},
                        "currency":"${currency}"
                    }
                },
                {
                    "daysAged":"${agingBalances3DaysAged}",
                    "amount":{
                        "amount":${agingBalances3DaysAgedAmount},
                        "currency":"${currency}"
                    }
                }
            ],
            "oldestCredit":{
                "creditAmount":{
                    "amount":${oldestCreditCreditAmount},
                    "currency":"${currency}"
                }
            },
            "currentFloorLimit":{
                "baseLimit":{
                    "amount":${currentFloorLimitBaseLimitAmount},
                    "currency":"${currency}"
                },
                "highCostLimit":{
                    "amount":${currentFloorLimitHighCostLimitAmount},
                    "currency":"${currency}"
                }
            },
            "status":{
               "effectiveDateTime":"2019-12-12T18:06:35Z",
               "value":"ON-HOLD"
            },
            "storeKeySet":{
               "secondaryKeys":[
                  {
                     "storeName":"HomeDelivery",
                     "keyName":"C-M-G",
                     "keyComponents":[
                        {
                           "name":"CustomerNumber",
                           "value":"${customerNumber}"
                        },
                        {
                           "name":"MailGroup",
                           "value":"${mailGroup}"
                        },
                        {
                           "name":"SubGroup",
                           "value":"${subGroup}"
                        }
                     ]
                  },
                  {
                     "storeName":"HomeDelivery",
                     "keyName":"AGN",
                     "keyComponents":[
                        {
                           "name":"Individual-AGN-ID",
                           "value":"0"
                        }
                     ]
                  },
                  {
                     "storeName":"HomeDelivery",
                     "keyName":"M",
                     "keyComponents":[
                        {
                           "name":"MembershipId",
                           "value":"${membershipId}"
                        }
                     ]
                  }
               ]
            }
            }
        }
    }
    """

    Given message kafkaDeleteRequest
    And <kafkaDeleteRequest> payload is
    """
    {
       "processorError":null,
       "context":null,
       "messageVersion":1,
       "header":{
          "parentId":null,
          "operation":"DELETE",
          "payloadType":null,
          "originalSource":"${headerOriginalSource}",
          "sourceDateTime":"${headerSourceDateTime}",
          "publisher":"${headerPublisher}",
          "publisherType":null,
          "transactionId":"${transactionId}",
          "tenantId":${tenantId},
          "requestId":null
       },
       "payload":{
          "resourceId": "${resourceId}",
          "accountHolder": {
              ${personResourceId}
          },
          "currentBalance":{
             "amount":${currentBalanceAmount},
             "currency":"${currency}"
          },
          "totalChargesInProcess":{
             "amount": ${totalChargesInProcessAmount},
             "currency":"${currency}"
          },
          "totalPaymentsInProcess":null,
          "totalCreditsInProcess":null,
          "agingBalances":[
             {
                "daysAged":"${agingBalances1DaysAged}",
                "amount":{
                   "amount":${agingBalances1DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances2DaysAged}",
                "amount":{
                   "amount":${agingBalances2DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances3DaysAged}",
                "amount":{
                   "amount":${agingBalances3DaysAgedAmount},
                   "currency":"${currency}"
                }
             }
          ],
          "oldestCredit":{
             "creditAmount":{
                "amount":${oldestCreditCreditAmount},
                "currency":"${currency}"
             },
             "creditDate":null
          },
          "collectionLetters":null,
          "lastStatementDate":null,
          "currentFloorLimit":{
             "baseLimit":{
                "amount":${currentFloorLimitBaseLimitAmount},
                "currency":"${currency}"
             },
             "highCostLimit":{
                "amount":${currentFloorLimitHighCostLimitAmount},
                "currency":"${currency}"
             }
          },
          "personalCeilingLimit":null,
          "debtThresholdExceededAsOf":null,
          "creditorEvents":null,
          "collectionAgencies":null,
          "extendedPaymentPlanParticipant":null,
            "status":{
               "effectiveDateTime":"2019-12-13T18:06:35+00:00",
               "value":"DECEASED"
            },
          "storeKeySet":{
             "primaryKey":null,
             "secondaryKeys":[
                {
                   "storeName":"HomeDelivery",
                   "keyName":"C-M-G",
                   "keyComponents":[
                      {
                         "name":"CustomerNumber",
                         "value":"${customerNumber}"
                      },
                      {
                         "name":"MailGroup",
                         "value":"${mailGroup}"
                      },
                      {
                         "name":"SubGroup",
                         "value":"${subGroup}"
                      }
                   ],
                   "status":null
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"AGN",
                   "keyComponents":[
                      {
                         "name":"Individual-AGN-ID",
                         "value":"0"
                      }
                   ],
                   "status":null
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"M",
                   "keyComponents":[
                      {
                         "name":"MembershipId",
                         "value":"${membershipId}"
                      }
                   ],
                   "status":null
                }
             ]
          }
       }
    }
    """

    Given message kafkaLatestTopicDeleteResponse
    And <kafkaLatestTopicDeleteResponse> payload is
    """
    {
        "messageVersion":1,
        "header":{
            "operation":"DELETE",
            "originalSource":"${headerOriginalSource}",
            "sourceDateTime":"${headerSourceDateTime}",
            "publisher":"${headerPublisher}",
            "transactionId":"${transactionId}",
            "tenantId":${tenantId}
        }
    }
    """

    Given message pfaGetRequest
    And <pfaGetRequest> header Content-Type is "application/json"
    And <pfaGetRequest> header citrus_http_method is "GET"
    And <pfaGetRequest> header citrus_request_path is "/${resourceId}"

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
          "currentBalance":{
             "amount":${currentBalanceAmount},
             "currency":"${currency}"
          },
          "totalChargesInProcess":{
             "amount": ${totalChargesInProcessAmount},
             "currency":"${currency}"
          },
          "agingBalances":[
             {
                "daysAged":"${agingBalances1DaysAged}",
                "amount":{
                   "amount":${agingBalances1DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances2DaysAged}",
                "amount":{
                   "amount":${agingBalances2DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances3DaysAged}",
                "amount":{
                   "amount":${agingBalances3DaysAgedAmount},
                   "currency":"${currency}"
                }
             }
          ],
          "oldestCredit":{
             "creditAmount":{
                "amount":${oldestCreditCreditAmount},
                "currency":"${currency}"
             }
          },
          "currentFloorLimit":{
             "baseLimit":{
                "amount":${currentFloorLimitBaseLimitAmount},
                "currency":"${currency}"
             },
             "highCostLimit":{
                "amount":${currentFloorLimitHighCostLimitAmount},
                "currency":"${currency}"
             }
          },
          "status":{
             "effectiveDateTime":"2019-12-11T18:06:35Z",
             "value":"ACTIVE"
          },
          "storeKeySet":{
             "secondaryKeys":[
                {
                   "storeName":"HomeDelivery",
                   "keyName":"C-M-G",
                   "keyComponents":[
                      {
                         "name":"CustomerNumber",
                         "value":"${customerNumber}"
                      },
                      {
                         "name":"MailGroup",
                         "value":"${mailGroup}"
                      },
                      {
                         "name":"SubGroup",
                         "value":"${subGroup}"
                      }
                   ]
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"AGN",
                   "keyComponents":[
                      {
                         "name":"Individual-AGN-ID",
                         "value":"0"
                      }
                   ]
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"M",
                   "keyComponents":[
                      {
                         "name":"MembershipId",
                         "value":"${membershipId}"
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

    Given message pfaUpdateResponse
    And <pfaUpdateResponse> header Content-Type is "@startsWith('application/json')@"
    And <pfaUpdateResponse> header citrus_http_status_code is "200"
    And <pfaUpdateResponse> header citrus_http_reason_phrase is "OK"
    And <pfaUpdateResponse> payload is
    """
    {
      "resourceId": "@variable('resourceId')@",
      "updatedDateTime": "@variable('updatedDateTime')@",
         "accountHolder": {
              ${personResourceId}
          },
          "currentBalance":{
             "amount":${newCurrentBalanceAmount},
             "currency":"${currency}"
          },
          "totalChargesInProcess":{
             "amount": ${totalChargesInProcessAmount},
             "currency":"${currency}"
          },
          "agingBalances":[
             {
                "daysAged":"${agingBalances1DaysAged}",
                "amount":{
                   "amount":${agingBalances1DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances2DaysAged}",
                "amount":{
                   "amount":${agingBalances2DaysAgedAmount},
                   "currency":"${currency}"
                }
             },
             {
                "daysAged":"${agingBalances3DaysAged}",
                "amount":{
                   "amount":${agingBalances3DaysAgedAmount},
                   "currency":"${currency}"
                }
             }
          ],
          "oldestCredit":{
             "creditAmount":{
                "amount":${oldestCreditCreditAmount},
                "currency":"${currency}"
             }
          },
          "currentFloorLimit":{
             "baseLimit":{
                "amount":${currentFloorLimitBaseLimitAmount},
                "currency":"${currency}"
             },
             "highCostLimit":{
                "amount":${currentFloorLimitHighCostLimitAmount},
                "currency":"${currency}"
             }
          },
          "status":{
               "effectiveDateTime":"2019-12-12T18:06:35Z",
               "value":"ON-HOLD"
          },
          "storeKeySet":{
             "secondaryKeys":[
                {
                   "storeName":"HomeDelivery",
                   "keyName":"C-M-G",
                   "keyComponents":[
                      {
                         "name":"CustomerNumber",
                         "value":"${customerNumber}"
                      },
                      {
                         "name":"MailGroup",
                         "value":"${mailGroup}"
                      },
                      {
                         "name":"SubGroup",
                         "value":"${subGroup}"
                      }
                   ]
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"AGN",
                   "keyComponents":[
                      {
                         "name":"Individual-AGN-ID",
                         "value":"0"
                      }
                   ]
                },
                {
                   "storeName":"HomeDelivery",
                   "keyName":"M",
                   "keyComponents":[
                      {
                         "name":"MembershipId",
                         "value":"${membershipId}"
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

    Given message pfaDeleteResponse
    And <pfaDeleteResponse> header citrus_http_status_code is "${hTTPErrorCode}"
    And <pfaDeleteResponse> header citrus_http_reason_phrase is "${hTTPErrorMessage}"
    And <pfaDeleteResponse> payload is
    """
    """

    Given message kafkaChangeTopicDeleteResponse
    And <kafkaChangeTopicDeleteResponse> payload is
    """
      {
       "messageVersion":1,
        "header":{
            "operation":"DELETE",
            "originalSource":"${headerOriginalSource}",
            "sourceDateTime":"${headerSourceDateTime}",
            "publisher":"${headerPublisher}",
            "transactionId":"${transactionId}",
            "tenantId":${tenantId}
        },
        "payload":{

            "beforeData":{
                "resourceId": "@variable('resourceId')@",
                "updatedDateTime":"@matchesDatePattern('yyyy-MM-dd')@",
                "currentBalance":{
                    "amount":${newCurrentBalanceAmount},
                    "currency":"${currency}"
                },
                "totalChargesInProcess":{
                    "amount": ${totalChargesInProcessAmount},
                    "currency":"${currency}"
                },
                "agingBalances":[
                    {
                        "daysAged":"${agingBalances1DaysAged}",
                        "amount":{
                            "amount":${agingBalances1DaysAgedAmount},
                            "currency":"${currency}"
                        }
                    },
                    {
                        "daysAged":"${agingBalances2DaysAged}",
                        "amount":{
                            "amount": ${agingBalances2DaysAgedAmount},
                            "currency":"${currency}"
                        }
                    },
                    {
                        "daysAged":"${agingBalances3DaysAged}",
                        "amount":{
                            "amount":${agingBalances3DaysAgedAmount},
                            "currency":"${currency}"
                        }
                    }
                ],
                "oldestCredit":{
                    "creditAmount":{
                        "amount":${oldestCreditCreditAmount},
                        "currency":"${currency}"
                    }
                },
                "currentFloorLimit":{
                    "baseLimit":{
                        "amount":${currentFloorLimitBaseLimitAmount},
                        "currency":"${currency}"
                    },
                    "highCostLimit":{
                        "amount":${currentFloorLimitHighCostLimitAmount},
                        "currency":"${currency}"
                    }
                },
                "status":{
                   "effectiveDateTime":"2019-12-12T18:06:35Z",
                   "value":"ON-HOLD"
                },
                "storeKeySet":{
                    "secondaryKeys":[
                        {
                            "storeName":"HomeDelivery",
                            "keyName":"C-M-G",
                            "keyComponents":[
                                {
                                    "name":"CustomerNumber",
                                    "value":"@variable('customerNumber')@"
                                },
                                {
                                    "name":"MailGroup",
                                    "value":"@variable('mailGroup')@"
                                },
                                {
                                    "name":"SubGroup",
                                    "value":"@variable('subGroup')@"
                                }
                            ]
                        },
                        {
                            "storeName":"HomeDelivery",
                            "keyName":"AGN",
                            "keyComponents":[
                                {
                                    "name":"Individual-AGN-ID",
                                    "value":"0"
                                }
                            ]
                        },
                        {
                            "storeName":"HomeDelivery",
                            "keyName":"M",
                            "keyComponents":[
                                {
                                    "name":"MembershipId",
                                    "value":"@variable('membershipId')@"
                                }
                            ]
                        }
                    ]
                },
                "links":[

                ]
            }
        }
    }
    """

  @DEV
  Scenario:1 Gets response for kafka
    Given variables
      | resourceId                           | citrus:randomUUID()                         |
      | id1                                  | citrus:randomUUID()                         |
      | personResourceId                     | "personResourceId":"${id1}"                 |
      | customerNumber                       | citrus:randomString(12, UPPERCASE, true)    |
      | mailGroup                            | citrus:randomString(3, UPPERCASE, false)    |
      | subGroup                             | citrus:randomString(7, UPPERCASE, true)     |
      | membershipId                         | citrus:randomNumber(12)                     |
      | headerOriginalSource                 | NRXCUS                                      |
      | headerSourceDateTime                 | citrus:currentDate('yyyy-MM-dd'T'hh:mm:ss') |
      | headerPublisher                      | PEPPFACT                                    |
      | transactionId                        | ${globalTransactionId}                      |
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
      | hTTPErrorCode                        | 404                                         |
      | hTTPErrorMessage                     | NOT_FOUND                                   |
      | tenantId                             | 12345678                                    |


    # Insert Scenario
    When <producerSyncTopicEndpoint> sends message <kafkaInsertRequest>
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicInsertResponse>
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicInsertResponse>

    # Getting the inserted data
    And <pfaClient> sends message <pfaGetRequest>
    And <pfaClient> should receive JSON message <pfaGETResponse>

    # Update Scenario
    And <producerSyncTopicEndpoint> sends message <kafkaUpdateRequest>
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicUpdateResponse>
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicUpdateResponse>

    # Getting the updated data
    And <pfaClient> sends message <pfaGetRequest>
    And <pfaClient> should receive JSON message <pfaUpdateResponse>

    # Delete Scenario
    And <producerSyncTopicEndpoint> sends message <kafkaDeleteRequest>
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicDeleteResponse>
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicDeleteResponse>

    # Getting the updated data
    And <pfaClient> sends message <pfaGetRequest>
    And <pfaClient> should receive JSON message <pfaDeleteResponse>