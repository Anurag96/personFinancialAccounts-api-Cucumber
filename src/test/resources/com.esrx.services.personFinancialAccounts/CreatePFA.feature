Feature: Create person financial account

  Background:

    Given message pfaPOSTRequest
    And <pfaPOSTRequest> header Content-Type is "application/json"
    And <pfaPOSTRequest> header Tenantid is "${tenantId}"
    And <pfaPOSTRequest> header Transactionid is "${globalTransactionId}"
    And <pfaPOSTRequest> header citrus_http_method is "POST"
    And <pfaPOSTRequest> payload is
    """
{
  "accountHolder": {
    ${personResourceId}
  }
}
    """

    Given message pfaPOSTResponse
    And <pfaPOSTResponse> header Content-Type is "@startsWith('application/json')@"
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
"agingBalances": [
    {
      "amount": {
         ${agingBalances_amount},
         ${agingBalances_currency}
      },
       ${agingBalances_daysAged}
    }
  ],
   "collectionAgencies": [{
      "relavitevId": "7413bb1f-61dc-44b1-be81-928c059490a3",
      ${collectionAgencies_name},
      ${collectionAgencies_trackingIdentifier},
      ${collectionAgencies_sentToCollectionAgencyDate},
      "amount": {
        ${collectionAgencies_1_amount},
        ${collectionAgencies_1_currency}
      },
      "collectionStatus": {
        ${collectionAgencies_1_code},
        ${collectionAgencies_1_description},
        ${collectionAgencies_1_name}
      }
   }],
  "collectionLetters": [
      ${collectionLetters}
  ],
  "creditorEvents": [
    {
      ${creditorEvents_effectiveDateTime},
      ${creditorEvents_value}
    }
  ],
  "currentBalance": {
    ${currentBalanceAmount}
    ${currentBalanceCurrency}
  },
   "currentFloorLimit": {
    "baseLimit": {
        ${currentFloorLimit_baseLimit_Amount},
        ${currentFloorLimit_baseLimit_Currency}
    },
    "highCostLimit": {
        ${currentFloorLimit_highCostLimit_Amount},
        ${currentFloorLimit_highCostLimit_Currency}
    }
  },
  ${debtThresholdExceededAsOf},
    ${lastStatementDate},
  "oldestCredit": {
    "creditAmount": {
      ${oldestCredit_creditAmount},
      ${oldestCredit_currency}
    },
    ${creditDate}
  },
  "personalCeilingLimit": {
        ${personalCeilingLimit_creditAmount},
      ${personalCeilingLimit_currency}
  },
  "status": {
    ${status_effectiveDateTime},
     ${status_value}
  },
  "storeKeySet": {
    "primaryKey": {
      "keyComponents": [
        {
          ${storeKeySet_primaryKey_keyComponents_1_name},
          ${storeKeySet_primaryKey_keyComponents_1_value}
        }
      ],
       ${storeKeySet_primaryKey_keyName},
      "status": {
        ${storeKeySet_primaryKey_status_effectiveDateTime},
        ${storeKeySet_primaryKey_status_value}
      },
      ${storeKeySet_primaryKey_storeName}
    },
    "secondaryKeys": [
      {
        "keyComponents": [
          {
          ${storeKeySet_secondaryKeys_keyComponents_1_name},
          ${storeKeySet_secondaryKeys_keyComponents_1_value}
          }
        ],
         ${storeKeySet_secondaryKeys_keyName},
        "status": {
          ${storeKeySet_secondaryKeys_status_effectiveDateTime},
          ${storeKeySet_secondaryKeys_status_value}
        },
        ${storeKeySet_secondaryKeys_storeName}
      }
    ]
  },
  "totalChargesInProcess": {
          ${totalChargesInProcess_Amount},
        ${totalChargesInProcess_Currency}
  },
  "totalCreditsInProcess": {
          ${totalCreditsInProcess_Amount},
        ${totalCreditsInProcess_Currency}
  },
  "totalPaymentsInProcess": {
          ${totalPaymentsInProcess_Amount},
        ${totalPaymentsInProcess_Currency}
  }
}
    """

    Given message pfaFullPOSTResponse
    And <pfaFullPOSTResponse> header Content-Type is "@startsWith('application/json')@"
    And <pfaFullPOSTResponse> header citrus_http_status_code is "201"
    And <pfaFullPOSTResponse> header citrus_http_reason_phrase is "CREATED"
    And <pfaFullPOSTResponse> payload is
    """
 {"resourceId": "@variable('resourceId')@",
    "createdDateTime": "@variable('createdDateTime')@",
    "updatedDateTime": "@variable('updatedDateTime')@",
    "accountHolder": {
        ${personResourceId}
    },
"agingBalances": [
    {
      "amount": {
         ${agingBalances_amount},
         ${agingBalances_currency}
      },
       ${agingBalances_daysAged}
    }
  ],
   "collectionAgencies": [{
      "relavitevId": "@variable('relavitevId')@",
      ${collectionAgencies_name},
      ${collectionAgencies_trackingIdentifier},
      ${collectionAgencies_sentToCollectionAgencyDate},
      "amount": {
        ${collectionAgencies_1_amount},
        ${collectionAgencies_1_currency}
      },
      "collectionStatus": {
        ${collectionAgencies_1_code},
        ${collectionAgencies_1_description},
        ${collectionAgencies_1_name}
      }
   }],
     "collectionLetters": [
        ${collectionLetters}
  ],
  "creditorEvents": [
    {
      ${creditorEvents_effectiveDateTime},
      ${creditorEvents_value}
    }
  ],
  "currentBalance": {
    ${currentBalanceAmount}
    ${currentBalanceCurrency}
  },
  "currentFloorLimit": {
    "baseLimit": {
        ${currentFloorLimit_baseLimit_Amount},
        ${currentFloorLimit_baseLimit_Currency}
    },
    "highCostLimit": {
        ${currentFloorLimit_highCostLimit_Amount},
        ${currentFloorLimit_highCostLimit_Currency}
    }
  },
  ${debtThresholdExceededAsOf},

    ${lastStatementDate},
  "oldestCredit": {
    "creditAmount": {
      ${oldestCredit_creditAmount},
      ${oldestCredit_currency}
    },
    ${creditDate}
  },
  "personalCeilingLimit": {
        ${personalCeilingLimit_creditAmount},
      ${personalCeilingLimit_currency}
  },
  "status": {
    ${status_effectiveDateTime},
     ${status_value}
  },
  "storeKeySet": {
    "primaryKey": {
      "keyComponents": [
        {
          ${storeKeySet_primaryKey_keyComponents_1_name},
          ${storeKeySet_primaryKey_keyComponents_1_value}
        }
      ],
      ${storeKeySet_primaryKey_keyName},
      "status": {
        ${storeKeySet_primaryKey_status_effectiveDateTime},
        ${storeKeySet_primaryKey_status_value}
      },
      ${storeKeySet_primaryKey_storeName}
    },
    "secondaryKeys": [
      {
        "keyComponents": [
          {
          ${storeKeySet_secondaryKeys_keyComponents_1_name},
          ${storeKeySet_secondaryKeys_keyComponents_1_value}
          }
        ],
        ${storeKeySet_secondaryKeys_keyName},
        "status": {
          ${storeKeySet_secondaryKeys_status_effectiveDateTime},
          ${storeKeySet_secondaryKeys_status_value}
        },
       ${storeKeySet_secondaryKeys_storeName}
      }
    ]
  },
  "totalChargesInProcess": {
          ${totalChargesInProcess_Amount},
        ${totalChargesInProcess_Currency}
  },
  "totalCreditsInProcess": {
          ${totalCreditsInProcess_Amount},
        ${totalCreditsInProcess_Currency}
  },
  "totalPaymentsInProcess": {
          ${totalPaymentsInProcess_Amount},
        ${totalPaymentsInProcess_Currency}
  },
    "_links": {
        "self": {
            "href": "@variable('href')@"
        }
    }
    }
"""

    Given message pfaFullPUTRequest
    And <pfaFullPUTRequest> header Content-Type is "application/json"
    And <pfaFullPUTRequest> header Tenantid is "${tenantId}"
    And <pfaFullPUTRequest> header Transactionid is "${globalTransactionId}"
    And <pfaFullPUTRequest> header citrus_http_method is "PUT"
    And <pfaFullPUTRequest> header citrus_request_path is "/${resourceId}"
    And <pfaFullPUTRequest> payload is
    """
     {
     "resourceId": "${resourceId}",
      "accountHolder": {
        ${personResourceId}
      },
    "agingBalances": [
        {
          "amount": {
             ${agingBalances_amount},
             ${agingBalances_currency}
          },
           ${agingBalances_daysAged}
        }
      ],
   "collectionAgencies": [{
      "relavitevId": "7413bb1f-61dc-44b1-be81-928c059490a3",
      ${collectionAgencies_name},
      ${collectionAgencies_trackingIdentifier},
      ${collectionAgencies_sentToCollectionAgencyDate},
      "amount": {
        ${collectionAgencies_1_amount},
        ${collectionAgencies_1_currency}
      },
      "collectionStatus": {
        ${collectionAgencies_1_code},
        ${collectionAgencies_1_description},
        ${collectionAgencies_1_name}
      }
   }],
      "collectionLetters": [
          ${collectionLetters}
      ],
      "creditorEvents": [
        {
          ${creditorEvents_effectiveDateTime},
          ${creditorEvents_value}
        }
      ],
      "currentBalance": {
        ${currentBalanceAmount}
        ${currentBalanceCurrency}
      },
       "currentFloorLimit": {
        "baseLimit": {
            ${currentFloorLimit_baseLimit_Amount},
            ${currentFloorLimit_baseLimit_Currency}
        },
        "highCostLimit": {
            ${currentFloorLimit_highCostLimit_Amount},
            ${currentFloorLimit_highCostLimit_Currency}
        }
      },
      ${debtThresholdExceededAsOf},
        ${lastStatementDate},
      "oldestCredit": {
        "creditAmount": {
          ${oldestCredit_creditAmount},
          ${oldestCredit_currency}
        },
        ${creditDate}
      },
      "personalCeilingLimit": {
            ${personalCeilingLimit_creditAmount},
          ${personalCeilingLimit_currency}
      },
      "status": {
        ${new_status_effectiveDateTime},
         ${new_status_value}
      },
      "storeKeySet": {
        "primaryKey": {
          "keyComponents": [
            {
              ${storeKeySet_primaryKey_keyComponents_1_name},
              ${storeKeySet_primaryKey_keyComponents_1_value}
            }
          ],
           ${storeKeySet_primaryKey_keyName},
          "status": {
            ${storeKeySet_primaryKey_status_effectiveDateTime},
            ${storeKeySet_primaryKey_status_value}
          },
          ${storeKeySet_primaryKey_storeName}
        },
        "secondaryKeys": [
          {
            "keyComponents": [
              {
              ${storeKeySet_secondaryKeys_keyComponents_1_name},
              ${storeKeySet_secondaryKeys_keyComponents_1_value}
              }
            ],
             ${storeKeySet_secondaryKeys_keyName},
            "status": {
              ${storeKeySet_secondaryKeys_status_effectiveDateTime},
              ${storeKeySet_secondaryKeys_status_value}
            },
            ${storeKeySet_secondaryKeys_storeName}
          }
        ]
      },
      "totalChargesInProcess": {
              ${totalChargesInProcess_Amount},
            ${totalChargesInProcess_Currency}
      },
      "totalCreditsInProcess": {
              ${totalCreditsInProcess_Amount},
            ${totalCreditsInProcess_Currency}
      },
      "totalPaymentsInProcess": {
              ${totalPaymentsInProcess_Amount},
            ${totalPaymentsInProcess_Currency}
      }
    }
        """

    Given message pfaFullPUTResponse
    And <pfaFullPUTResponse> header Content-Type is "@startsWith('application/json')@"
    And <pfaFullPUTResponse> header citrus_http_status_code is "200"
    And <pfaFullPUTResponse> header citrus_http_reason_phrase is "OK"
    And <pfaFullPUTResponse> payload is
    """
 {
  "resourceId": "${resourceId}",
    "updatedDateTime": "@variable('updatedDateTime')@",
    "accountHolder": {
        ${personResourceId}
    },
"agingBalances": [
    {
      "amount": {
         ${agingBalances_amount},
         ${agingBalances_currency}
      },
       ${agingBalances_daysAged}
    }
  ],
      "collectionAgencies": [{
      "relavitevId": "@variable('relavitevId')@",
      ${collectionAgencies_name},
      ${collectionAgencies_trackingIdentifier},
      ${collectionAgencies_sentToCollectionAgencyDate},
      "amount": {
        ${collectionAgencies_1_amount},
        ${collectionAgencies_1_currency}
      },
      "collectionStatus": {
        ${collectionAgencies_1_code},
        ${collectionAgencies_1_description},
        ${collectionAgencies_1_name}
      }
   }],
     "collectionLetters": [
        ${collectionLetters}
  ],
  "creditorEvents": [
    {
      ${creditorEvents_effectiveDateTime},
      ${creditorEvents_value}
    }
  ],
  "currentBalance": {
    ${currentBalanceAmount}
    ${currentBalanceCurrency}
  },
  "currentFloorLimit": {
    "baseLimit": {
        ${currentFloorLimit_baseLimit_Amount},
        ${currentFloorLimit_baseLimit_Currency}
    },
    "highCostLimit": {
        ${currentFloorLimit_highCostLimit_Amount},
        ${currentFloorLimit_highCostLimit_Currency}
    }
  },
  ${debtThresholdExceededAsOf},

    ${lastStatementDate},
  "oldestCredit": {
    "creditAmount": {
      ${oldestCredit_creditAmount},
      ${oldestCredit_currency}
    },
    ${creditDate}
  },
  "personalCeilingLimit": {
        ${personalCeilingLimit_creditAmount},
      ${personalCeilingLimit_currency}
  },
  "status": {
    ${new_status_effectiveDateTime},
     ${new_status_value}
  },
  "storeKeySet": {
    "primaryKey": {
      "keyComponents": [
        {
          ${storeKeySet_primaryKey_keyComponents_1_name},
          ${storeKeySet_primaryKey_keyComponents_1_value}
        }
      ],
      ${storeKeySet_primaryKey_keyName},
      "status": {
        ${storeKeySet_primaryKey_status_effectiveDateTime},
        ${storeKeySet_primaryKey_status_value}
      },
      ${storeKeySet_primaryKey_storeName}
    },
    "secondaryKeys": [
      {
        "keyComponents": [
          {
          ${storeKeySet_secondaryKeys_keyComponents_1_name},
          ${storeKeySet_secondaryKeys_keyComponents_1_value}
          }
        ],
        ${storeKeySet_secondaryKeys_keyName},
        "status": {
          ${storeKeySet_secondaryKeys_status_effectiveDateTime},
          ${storeKeySet_secondaryKeys_status_value}
        },
       ${storeKeySet_secondaryKeys_storeName}
      }
    ]
  },
  "totalChargesInProcess": {
          ${totalChargesInProcess_Amount},
        ${totalChargesInProcess_Currency}
  },
  "totalCreditsInProcess": {
          ${totalCreditsInProcess_Amount},
        ${totalCreditsInProcess_Currency}
  },
  "totalPaymentsInProcess": {
          ${totalPaymentsInProcess_Amount},
        ${totalPaymentsInProcess_Currency}
  },
    "_links": {
        "self": {
            "href": "@variable('href')@"
        }
    }
    }
"""

    Given message pfaGetRequestNewRecord
    And <pfaGetRequestNewRecord> header Content-Type is "application/json"
    And <pfaGetRequestNewRecord> header citrus_http_method is "GET"
    And <pfaGetRequestNewRecord> header citrus_request_path is "/${resourceId}"


    Given message pfaGetResponseNewRecord
    And <pfaGetResponseNewRecord> header Content-Type is "@startsWith('application/json')@"
    And <pfaGetResponseNewRecord> header citrus_http_status_code is "200"
    And <pfaGetResponseNewRecord> header citrus_http_reason_phrase is "OK"
    And <pfaGetResponseNewRecord> payload is
    """
 {"resourceId": "${resourceId}",
    "createdDateTime": "@ignore@",
    "updatedDateTime": "@ignore@",
    "accountHolder": {
        ${personResourceId}
    },
"agingBalances": [
    {
      "amount": {
         ${agingBalances_amount},
         ${agingBalances_currency}
      },
       ${agingBalances_daysAged}
    }
  ],
   "collectionAgencies": [{
      "relavitevId": "@variable('relavitevId')@",
      ${collectionAgencies_name},
      ${collectionAgencies_trackingIdentifier},
      ${collectionAgencies_sentToCollectionAgencyDate},
      "amount": {
        ${collectionAgencies_1_amount},
        ${collectionAgencies_1_currency}
      },
      "collectionStatus": {
        ${collectionAgencies_1_code},
        ${collectionAgencies_1_description},
        ${collectionAgencies_1_name}
      }
   }],
     "collectionLetters": [
        ${collectionLetters}
  ],
  "creditorEvents": [
    {
      ${creditorEvents_effectiveDateTime},
      ${creditorEvents_value}
    }
  ],
  "currentBalance": {
    ${currentBalanceAmount}
    ${currentBalanceCurrency}
  },
  "currentFloorLimit": {
    "baseLimit": {
        ${currentFloorLimit_baseLimit_Amount},
        ${currentFloorLimit_baseLimit_Currency}
    },
    "highCostLimit": {
        ${currentFloorLimit_highCostLimit_Amount},
        ${currentFloorLimit_highCostLimit_Currency}
    }
  },
  ${debtThresholdExceededAsOf},
    ${lastStatementDate},
  "oldestCredit": {
    "creditAmount": {
      ${oldestCredit_creditAmount},
      ${oldestCredit_currency}
    },
    ${creditDate}
  },
  "personalCeilingLimit": {
        ${personalCeilingLimit_creditAmount},
      ${personalCeilingLimit_currency}
  },
  "status": {
    ${status_effectiveDateTime},
     ${status_value}
  },
  "storeKeySet": {
    "primaryKey": {
      "keyComponents": [
        {
          ${storeKeySet_primaryKey_keyComponents_1_name},
          ${storeKeySet_primaryKey_keyComponents_1_value}
        }
      ],
      ${storeKeySet_primaryKey_keyName},
      "status": {
        ${storeKeySet_primaryKey_status_effectiveDateTime},
        ${storeKeySet_primaryKey_status_value}
      },
      ${storeKeySet_primaryKey_storeName}
    },
    "secondaryKeys": [
      {
        "keyComponents": [
          {
          ${storeKeySet_secondaryKeys_keyComponents_1_name},
          ${storeKeySet_secondaryKeys_keyComponents_1_value}
          }
        ],
        ${storeKeySet_secondaryKeys_keyName},
        "status": {
          ${storeKeySet_secondaryKeys_status_effectiveDateTime},
          ${storeKeySet_secondaryKeys_status_value}
        },
       ${storeKeySet_secondaryKeys_storeName}
      }
    ]
  },
  "totalChargesInProcess": {
          ${totalChargesInProcess_Amount},
        ${totalChargesInProcess_Currency}
  },
  "totalCreditsInProcess": {
          ${totalCreditsInProcess_Amount},
        ${totalCreditsInProcess_Currency}
  },
  "totalPaymentsInProcess": {
          ${totalPaymentsInProcess_Amount},
        ${totalPaymentsInProcess_Currency}
  },
    "_links": {
        "self": {
            "href": "@variable('href')@"
        }
    }
    }
"""

    Given message pfaGetResponseUpdatedRecord
    And <pfaGetResponseUpdatedRecord> header Content-Type is "@startsWith('application/json')@"
    And <pfaFullPUTRequest> header Tenantid is "${tenantId}"
    And <pfaFullPUTRequest> header Transactionid is "${globalTransactionId}"
    And <pfaGetResponseUpdatedRecord> header citrus_http_status_code is "200"
    And <pfaGetResponseUpdatedRecord> header citrus_http_reason_phrase is "OK"
    And <pfaGetResponseUpdatedRecord> payload is
    """
 {"resourceId": "${resourceId}",
    "createdDateTime": "@ignore@",
    "updatedDateTime": "@ignore@",
    "accountHolder": {
        ${personResourceId}
    },
"agingBalances": [
    {
      "amount": {
         ${agingBalances_amount},
         ${agingBalances_currency}
      },
       ${agingBalances_daysAged}
    }
  ],
   "collectionAgencies": [{
      "relavitevId": "@variable('relavitevId')@",
      ${collectionAgencies_name},
      ${collectionAgencies_trackingIdentifier},
      ${collectionAgencies_sentToCollectionAgencyDate},
      "amount": {
        ${collectionAgencies_1_amount},
        ${collectionAgencies_1_currency}
      },
      "collectionStatus": {
        ${collectionAgencies_1_code},
        ${collectionAgencies_1_description},
        ${collectionAgencies_1_name}
      }
   }],
     "collectionLetters": [
        ${collectionLetters}
  ],
  "creditorEvents": [
    {
      ${creditorEvents_effectiveDateTime},
      ${creditorEvents_value}
    }
  ],
  "currentBalance": {
    ${currentBalanceAmount}
    ${currentBalanceCurrency}
  },
  "currentFloorLimit": {
    "baseLimit": {
        ${currentFloorLimit_baseLimit_Amount},
        ${currentFloorLimit_baseLimit_Currency}
    },
    "highCostLimit": {
        ${currentFloorLimit_highCostLimit_Amount},
        ${currentFloorLimit_highCostLimit_Currency}
    }
  },
  ${debtThresholdExceededAsOf},
    ${lastStatementDate},
  "oldestCredit": {
    "creditAmount": {
      ${oldestCredit_creditAmount},
      ${oldestCredit_currency}
    },
    ${creditDate}
  },
  "personalCeilingLimit": {
        ${personalCeilingLimit_creditAmount},
      ${personalCeilingLimit_currency}
  },
  "status": {
    ${new_status_effectiveDateTime},
     ${new_status_value}
  },
  "storeKeySet": {
    "primaryKey": {
      "keyComponents": [
        {
          ${storeKeySet_primaryKey_keyComponents_1_name},
          ${storeKeySet_primaryKey_keyComponents_1_value}
        }
      ],
      ${storeKeySet_primaryKey_keyName},
      "status": {
        ${storeKeySet_primaryKey_status_effectiveDateTime},
        ${storeKeySet_primaryKey_status_value}
      },
      ${storeKeySet_primaryKey_storeName}
    },
    "secondaryKeys": [
      {
        "keyComponents": [
          {
          ${storeKeySet_secondaryKeys_keyComponents_1_name},
          ${storeKeySet_secondaryKeys_keyComponents_1_value}
          }
        ],
        ${storeKeySet_secondaryKeys_keyName},
        "status": {
          ${storeKeySet_secondaryKeys_status_effectiveDateTime},
          ${storeKeySet_secondaryKeys_status_value}
        },
       ${storeKeySet_secondaryKeys_storeName}
      }
    ]
  },
  "totalChargesInProcess": {
          ${totalChargesInProcess_Amount},
        ${totalChargesInProcess_Currency}
  },
  "totalCreditsInProcess": {
          ${totalCreditsInProcess_Amount},
        ${totalCreditsInProcess_Currency}
  },
  "totalPaymentsInProcess": {
          ${totalPaymentsInProcess_Amount},
        ${totalPaymentsInProcess_Currency}
  },
    "_links": {
        "self": {
            "href": "@variable('href')@"
        }
    }
    }
"""

    Given message pfaPOSTRequestBAD_REQUEST
    And <pfaPOSTRequestBAD_REQUEST> header Content-Type is "application/json"
    And <pfaPOSTRequestBAD_REQUEST> header citrus_http_method is "POST"
    And <pfaPOSTRequestBAD_REQUEST> payload is
    """
{
  "accountHolder": {
    ${personResourceId}
  },
  "agingBalances": [
    {
      "amount": {
        "amount": 0,
        "currency": "string"
      },
      "daysAged": "string"
    }
  ],
  "storeKeySet": {
    "primaryKey": {
      "keyComponents": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "keyName": "string",
      "status": {
        "effectiveDateTime": "2018-09-11T18:06:35+00:00",
        "value": "string"
      },
      "storeName": "string"
    },
    "secondaryKeys": [
      {
        "keyComponents": [
          {
            "name": "string",
            "value": "string"
          }
        ],
        "keyName": "string",
        "status": {
          "effectiveDateTime": "2018-09-11T18:06:35+00:00",
          "value": "string"
        },
        "storeName": "string"
      }
    ]
  },
  "totalChargesInProcess": {
    "amount": 0,
    "currency": "string"
  },
  "totalCreditsInProcess": {
    "amount": 0,
    "currency": "string"
  },
  "totalPaymentsInProcess": {
    "amount": 0,
    "currency": "string"
  },
  "updatedDateTime": "2018-09-11T18:06:35+00:00",
  "collectionAgencies": [
    {
      "amount": {
        "amount": 0,
        "currency": "string"
      },
      "collectionStatus": {
        "code": "string",
        "description": "string",
        "name": "string"
      },
      "name": "string",
      "relavitevId": "d16324e4-08c0-4ccd-ac23-7aa2add9702a",
      "sentToCollectionAgencyDate": "2018-09-11T18:06:35+00:00",
      "trackingIdentifier": "string"
    }
  ]

}
    """

    Given message pfaPOSTResponseBAD_REQUEST
    And <pfaPOSTResponseBAD_REQUEST> header Content-Type is "@startsWith('application/json')@"
    And <pfaPOSTResponseBAD_REQUEST> header citrus_http_status_code is "400"
    And <pfaPOSTResponseBAD_REQUEST> header citrus_http_reason_phrase is "BAD_REQUEST"
    And <pfaPOSTResponseBAD_REQUEST> payload is
    """
 {
    "status":400,
    "error":"BAD_REQUEST",
    "title":"Mandatory values missing",
    "message":"personResourceId is missing or invalid."
 }
"""

    Given message pfaPOSTRequestBAD_Invalid_REQUEST
    And <pfaPOSTRequestBAD_Invalid_REQUEST> header Content-Type is "application/json"
    And <pfaPOSTRequestBAD_Invalid_REQUEST> header citrus_http_method is "POST"
    And <pfaPOSTRequestBAD_Invalid_REQUEST> payload is
    """
{
  "accountHolder": {
    ${personResourceId}
  },
  "agingBalances": [
    {
      "amount": {
        "amount": 0,
        "currency": "string"
      },
      "daysAged": "string"
    }
  ],
  "storeKeySet": {
    "primaryKey": {
      "keyComponents": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "keyName": "string",
      "status": {
        "effectiveDateTime": "2018-09-11T18:06:35+00:00",
        "value": "string"
      },
      "storeName": "string"
    },
    "secondaryKeys": [
      {
        "keyComponents": [
          {
            "name": "string",
            "value": "string"
          }
        ],
        "keyName": "string",
        "status": {
          "effectiveDateTime": "2018-09-11T18:06:35+00:00",
          "value": "string"
        },
        "storeName": "string"
      }
    ]
  },
  "totalChargesInProcess": {
    "amount": 0,
    "currency": "string"
  },
  "totalCreditsInProcess": {
    "amount": 0,
    "currency": "string"
  },
  "totalPaymentsInProcess": {
    "amount": 0,
    "currency": "string"
  },
  "updatedDateTime": "2018-09-11T18:06:35+00:00",
  "collectionAgencies": [
    {
      "amount": {
        "amount": 0,
        "currency": "string"
      },
      "collectionStatus": {
        "code": "string",
        "description": "string",
        "name": "string"
      },
      "name": "string",
      "relavitevId": "d16324e4-08c0-4ccd-ac23-7aa2add9702a",
      "sentToCollectionAgencyDate": "2018-09-11T18:06:35+00:00",
      "trackingIdentifier": "string"
    }
  ]

}
    """

    Given message pfaPOSTResponseBAD_REQUEST_Invalid
    And <pfaPOSTResponseBAD_REQUEST_Invalid> header Content-Type is "@startsWith('application/json')@"
    And <pfaPOSTResponseBAD_REQUEST_Invalid> header citrus_http_status_code is "400"
    And <pfaPOSTResponseBAD_REQUEST_Invalid> header citrus_http_reason_phrase is "BAD_REQUEST"
    And <pfaPOSTResponseBAD_REQUEST_Invalid> payload is
    """
   {
  "status": 400,
  "error": "BAD_REQUEST",
  "title": "Malformed JSON request",
  "message": "Invalid Request: could not parse."
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


    Given message kafkaLatestTopicInsertFullResponse
    And <kafkaLatestTopicInsertFullResponse> payload is
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
        "agingBalances": [
            {
              "amount": {
                 ${agingBalances_amount},
                 ${agingBalances_currency}
              },
               ${agingBalances_daysAged}
            }
          ],
           "collectionAgencies": [{
              "relavitevId": "@variable('relavitevId')@",
              ${collectionAgencies_name},
              ${collectionAgencies_trackingIdentifier},
              ${collectionAgencies_sentToCollectionAgencyDate},
              "amount": {
                ${collectionAgencies_1_amount},
                ${collectionAgencies_1_currency}
              },
              "collectionStatus": {
                ${collectionAgencies_1_code},
                ${collectionAgencies_1_description},
                ${collectionAgencies_1_name}
              }
           }],
             "collectionLetters": [
                ${collectionLetters}
          ],
          "creditorEvents": [
            {
              ${creditorEvents_effectiveDateTime},
              ${creditorEvents_value}
            }
          ],
          "currentBalance": {
            ${currentBalanceAmount}
            ${currentBalanceCurrency}
          },
          "currentFloorLimit": {
            "baseLimit": {
                ${currentFloorLimit_baseLimit_Amount},
                ${currentFloorLimit_baseLimit_Currency}
            },
            "highCostLimit": {
                ${currentFloorLimit_highCostLimit_Amount},
                ${currentFloorLimit_highCostLimit_Currency}
            }
          },
          ${debtThresholdExceededAsOf},

            ${lastStatementDate},
          "oldestCredit": {
            "creditAmount": {
              ${oldestCredit_creditAmount},
              ${oldestCredit_currency}
            },
            ${creditDate}
          },
          "personalCeilingLimit": {
                ${personalCeilingLimit_creditAmount},
              ${personalCeilingLimit_currency}
          },
          "status": {
            ${status_effectiveDateTime},
             ${status_value}
          },
          "storeKeySet": {
            "primaryKey": {
              "keyComponents": [
                {
                  ${storeKeySet_primaryKey_keyComponents_1_name},
                  ${storeKeySet_primaryKey_keyComponents_1_value}
                }
              ],
              ${storeKeySet_primaryKey_keyName},
              "status": {
                ${storeKeySet_primaryKey_status_effectiveDateTime},
                ${storeKeySet_primaryKey_status_value}
              },
              ${storeKeySet_primaryKey_storeName}
            },
            "secondaryKeys": [
              {
                "keyComponents": [
                  {
                  ${storeKeySet_secondaryKeys_keyComponents_1_name},
                  ${storeKeySet_secondaryKeys_keyComponents_1_value}
                  }
                ],
                ${storeKeySet_secondaryKeys_keyName},
                "status": {
                  ${storeKeySet_secondaryKeys_status_effectiveDateTime},
                  ${storeKeySet_secondaryKeys_status_value}
                },
               ${storeKeySet_secondaryKeys_storeName}
              }
            ]
          },
          "totalChargesInProcess": {
                  ${totalChargesInProcess_Amount},
                ${totalChargesInProcess_Currency}
          },
          "totalCreditsInProcess": {
                  ${totalCreditsInProcess_Amount},
                ${totalCreditsInProcess_Currency}
          },
          "totalPaymentsInProcess": {
                  ${totalPaymentsInProcess_Amount},
                ${totalPaymentsInProcess_Currency}
          },
            "links": []
      }
    }
    """

    Given message kafkaChangeTopicInsertFullResponse
    And <kafkaChangeTopicInsertFullResponse> payload is
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
      "agingBalances": [
          {
            "amount": {
               ${agingBalances_amount},
               ${agingBalances_currency}
            },
             ${agingBalances_daysAged}
          }
        ],
         "collectionAgencies": [{
            "relavitevId": "@variable('relavitevId')@",
            ${collectionAgencies_name},
            ${collectionAgencies_trackingIdentifier},
            ${collectionAgencies_sentToCollectionAgencyDate},
            "amount": {
              ${collectionAgencies_1_amount},
              ${collectionAgencies_1_currency}
            },
            "collectionStatus": {
              ${collectionAgencies_1_code},
              ${collectionAgencies_1_description},
              ${collectionAgencies_1_name}
            }
         }],
           "collectionLetters": [
              ${collectionLetters}
        ],
        "creditorEvents": [
          {
            ${creditorEvents_effectiveDateTime},
            ${creditorEvents_value}
          }
        ],
        "currentBalance": {
          ${currentBalanceAmount}
          ${currentBalanceCurrency}
        },
        "currentFloorLimit": {
          "baseLimit": {
              ${currentFloorLimit_baseLimit_Amount},
              ${currentFloorLimit_baseLimit_Currency}
          },
          "highCostLimit": {
              ${currentFloorLimit_highCostLimit_Amount},
              ${currentFloorLimit_highCostLimit_Currency}
          }
        },
        ${debtThresholdExceededAsOf},

          ${lastStatementDate},
        "oldestCredit": {
          "creditAmount": {
            ${oldestCredit_creditAmount},
            ${oldestCredit_currency}
          },
          ${creditDate}
        },
        "personalCeilingLimit": {
              ${personalCeilingLimit_creditAmount},
            ${personalCeilingLimit_currency}
        },
        "status": {
          ${status_effectiveDateTime},
           ${status_value}
        },
        "storeKeySet": {
          "primaryKey": {
            "keyComponents": [
              {
                ${storeKeySet_primaryKey_keyComponents_1_name},
                ${storeKeySet_primaryKey_keyComponents_1_value}
              }
            ],
            ${storeKeySet_primaryKey_keyName},
            "status": {
              ${storeKeySet_primaryKey_status_effectiveDateTime},
              ${storeKeySet_primaryKey_status_value}
            },
            ${storeKeySet_primaryKey_storeName}
          },
          "secondaryKeys": [
            {
              "keyComponents": [
                {
                ${storeKeySet_secondaryKeys_keyComponents_1_name},
                ${storeKeySet_secondaryKeys_keyComponents_1_value}
                }
              ],
              ${storeKeySet_secondaryKeys_keyName},
              "status": {
                ${storeKeySet_secondaryKeys_status_effectiveDateTime},
                ${storeKeySet_secondaryKeys_status_value}
              },
             ${storeKeySet_secondaryKeys_storeName}
            }
          ]
        },
        "totalChargesInProcess": {
                ${totalChargesInProcess_Amount},
              ${totalChargesInProcess_Currency}
        },
        "totalCreditsInProcess": {
                ${totalCreditsInProcess_Amount},
              ${totalCreditsInProcess_Currency}
        },
        "totalPaymentsInProcess": {
                ${totalPaymentsInProcess_Amount},
              ${totalPaymentsInProcess_Currency}
        },
        "links": []
          }

        }
      }
      """

    Given message kafkaLatestTopicUpdateFullResponse
    And <kafkaLatestTopicUpdateFullResponse> payload is
    """
    {
      "messageVersion": 1,
      "header": {
        "operation":"UPDATE",
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
        "agingBalances": [
            {
              "amount": {
                 ${agingBalances_amount},
                 ${agingBalances_currency}
              },
               ${agingBalances_daysAged}
            }
          ],
           "collectionAgencies": [{
              "relavitevId": "@variable('relavitevId')@",
              ${collectionAgencies_name},
              ${collectionAgencies_trackingIdentifier},
              ${collectionAgencies_sentToCollectionAgencyDate},
              "amount": {
                ${collectionAgencies_1_amount},
                ${collectionAgencies_1_currency}
              },
              "collectionStatus": {
                ${collectionAgencies_1_code},
                ${collectionAgencies_1_description},
                ${collectionAgencies_1_name}
              }
           }],
             "collectionLetters": [
                ${collectionLetters}
          ],
          "creditorEvents": [
            {
              ${creditorEvents_effectiveDateTime},
              ${creditorEvents_value}
            }
          ],
          "currentBalance": {
            ${currentBalanceAmount}
            ${currentBalanceCurrency}
          },
          "currentFloorLimit": {
            "baseLimit": {
                ${currentFloorLimit_baseLimit_Amount},
                ${currentFloorLimit_baseLimit_Currency}
            },
            "highCostLimit": {
                ${currentFloorLimit_highCostLimit_Amount},
                ${currentFloorLimit_highCostLimit_Currency}
            }
          },
          ${debtThresholdExceededAsOf},

            ${lastStatementDate},
          "oldestCredit": {
            "creditAmount": {
              ${oldestCredit_creditAmount},
              ${oldestCredit_currency}
            },
            ${creditDate}
          },
          "personalCeilingLimit": {
                ${personalCeilingLimit_creditAmount},
              ${personalCeilingLimit_currency}
          },
          "status": {
            ${new_status_effectiveDateTime},
             ${new_status_value}
          },
          "storeKeySet": {
            "primaryKey": {
              "keyComponents": [
                {
                  ${storeKeySet_primaryKey_keyComponents_1_name},
                  ${storeKeySet_primaryKey_keyComponents_1_value}
                }
              ],
              ${storeKeySet_primaryKey_keyName},
              "status": {
                ${storeKeySet_primaryKey_status_effectiveDateTime},
                ${storeKeySet_primaryKey_status_value}
              },
              ${storeKeySet_primaryKey_storeName}
            },
            "secondaryKeys": [
              {
                "keyComponents": [
                  {
                  ${storeKeySet_secondaryKeys_keyComponents_1_name},
                  ${storeKeySet_secondaryKeys_keyComponents_1_value}
                  }
                ],
                ${storeKeySet_secondaryKeys_keyName},
                "status": {
                  ${storeKeySet_secondaryKeys_status_effectiveDateTime},
                  ${storeKeySet_secondaryKeys_status_value}
                },
               ${storeKeySet_secondaryKeys_storeName}
              }
            ]
          },
          "totalChargesInProcess": {
                  ${totalChargesInProcess_Amount},
                ${totalChargesInProcess_Currency}
          },
          "totalCreditsInProcess": {
                  ${totalCreditsInProcess_Amount},
                ${totalCreditsInProcess_Currency}
          },
          "totalPaymentsInProcess": {
                  ${totalPaymentsInProcess_Amount},
                ${totalPaymentsInProcess_Currency}
          },
            "links": []
      }
    }
    """

    Given message kafkaChangeTopicUpdateFullResponse
    And <kafkaChangeTopicUpdateFullResponse> payload is
    """
      {
        "messageVersion": 1,
        "header": {
          "operation": "UPDATE",
          "originalSource": "PEPPFACT",
          "publisher": "PEPPFACT",
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
      "agingBalances": [
          {
            "amount": {
               ${agingBalances_amount},
               ${agingBalances_currency}
            },
             ${agingBalances_daysAged}
          }
        ],
         "collectionAgencies": [{
            "relavitevId": "@variable('relavitevId')@",
            ${collectionAgencies_name},
            ${collectionAgencies_trackingIdentifier},
            ${collectionAgencies_sentToCollectionAgencyDate},
            "amount": {
              ${collectionAgencies_1_amount},
              ${collectionAgencies_1_currency}
            },
            "collectionStatus": {
              ${collectionAgencies_1_code},
              ${collectionAgencies_1_description},
              ${collectionAgencies_1_name}
            }
         }],
           "collectionLetters": [
              ${collectionLetters}
        ],
        "creditorEvents": [
          {
            ${creditorEvents_effectiveDateTime},
            ${creditorEvents_value}
          }
        ],
        "currentBalance": {
          ${currentBalanceAmount}
          ${currentBalanceCurrency}
        },
        "currentFloorLimit": {
          "baseLimit": {
              ${currentFloorLimit_baseLimit_Amount},
              ${currentFloorLimit_baseLimit_Currency}
          },
          "highCostLimit": {
              ${currentFloorLimit_highCostLimit_Amount},
              ${currentFloorLimit_highCostLimit_Currency}
          }
        },
        ${debtThresholdExceededAsOf},

          ${lastStatementDate},
        "oldestCredit": {
          "creditAmount": {
            ${oldestCredit_creditAmount},
            ${oldestCredit_currency}
          },
          ${creditDate}
        },
        "personalCeilingLimit": {
              ${personalCeilingLimit_creditAmount},
            ${personalCeilingLimit_currency}
        },
        "status": {
          ${status_effectiveDateTime},
           ${status_value}
        },
        "storeKeySet": {
          "primaryKey": {
            "keyComponents": [
              {
                ${storeKeySet_primaryKey_keyComponents_1_name},
                ${storeKeySet_primaryKey_keyComponents_1_value}
              }
            ],
            ${storeKeySet_primaryKey_keyName},
            "status": {
              ${storeKeySet_primaryKey_status_effectiveDateTime},
              ${storeKeySet_primaryKey_status_value}
            },
            ${storeKeySet_primaryKey_storeName}
          },
          "secondaryKeys": [
            {
              "keyComponents": [
                {
                ${storeKeySet_secondaryKeys_keyComponents_1_name},
                ${storeKeySet_secondaryKeys_keyComponents_1_value}
                }
              ],
              ${storeKeySet_secondaryKeys_keyName},
              "status": {
                ${storeKeySet_secondaryKeys_status_effectiveDateTime},
                ${storeKeySet_secondaryKeys_status_value}
              },
             ${storeKeySet_secondaryKeys_storeName}
            }
          ]
        },
        "totalChargesInProcess": {
                ${totalChargesInProcess_Amount},
              ${totalChargesInProcess_Currency}
        },
        "totalCreditsInProcess": {
                ${totalCreditsInProcess_Amount},
              ${totalCreditsInProcess_Currency}
        },
        "totalPaymentsInProcess": {
                ${totalPaymentsInProcess_Amount},
              ${totalPaymentsInProcess_Currency}
        },
                    "links": []
          },
               "data": {
      "resourceId": "@variable('resourceId')@",
          "createdDateTime": "@variable('createdDateTime')@",
          "updatedDateTime": "@variable('updatedDateTime')@",
          "accountHolder": {
              ${personResourceId}
          },
      "agingBalances": [
          {
            "amount": {
               ${agingBalances_amount},
               ${agingBalances_currency}
            },
             ${agingBalances_daysAged}
          }
        ],
         "collectionAgencies": [{
            "relavitevId": "@variable('relavitevId')@",
            ${collectionAgencies_name},
            ${collectionAgencies_trackingIdentifier},
            ${collectionAgencies_sentToCollectionAgencyDate},
            "amount": {
              ${collectionAgencies_1_amount},
              ${collectionAgencies_1_currency}
            },
            "collectionStatus": {
              ${collectionAgencies_1_code},
              ${collectionAgencies_1_description},
              ${collectionAgencies_1_name}
            }
         }],
           "collectionLetters": [
              ${collectionLetters}
        ],
        "creditorEvents": [
          {
            ${creditorEvents_effectiveDateTime},
            ${creditorEvents_value}
          }
        ],
        "currentBalance": {
          ${currentBalanceAmount}
          ${currentBalanceCurrency}
        },
        "currentFloorLimit": {
          "baseLimit": {
              ${currentFloorLimit_baseLimit_Amount},
              ${currentFloorLimit_baseLimit_Currency}
          },
          "highCostLimit": {
              ${currentFloorLimit_highCostLimit_Amount},
              ${currentFloorLimit_highCostLimit_Currency}
          }
        },
        ${debtThresholdExceededAsOf},

          ${lastStatementDate},
        "oldestCredit": {
          "creditAmount": {
            ${oldestCredit_creditAmount},
            ${oldestCredit_currency}
          },
          ${creditDate}
        },
        "personalCeilingLimit": {
              ${personalCeilingLimit_creditAmount},
            ${personalCeilingLimit_currency}
        },
        "status": {
          ${new_status_effectiveDateTime},
           ${new_status_value}
        },
        "storeKeySet": {
          "primaryKey": {
            "keyComponents": [
              {
                ${storeKeySet_primaryKey_keyComponents_1_name},
                ${storeKeySet_primaryKey_keyComponents_1_value}
              }
            ],
            ${storeKeySet_primaryKey_keyName},
            "status": {
              ${storeKeySet_primaryKey_status_effectiveDateTime},
              ${storeKeySet_primaryKey_status_value}
            },
            ${storeKeySet_primaryKey_storeName}
          },
          "secondaryKeys": [
            {
              "keyComponents": [
                {
                ${storeKeySet_secondaryKeys_keyComponents_1_name},
                ${storeKeySet_secondaryKeys_keyComponents_1_value}
                }
              ],
              ${storeKeySet_secondaryKeys_keyName},
              "status": {
                ${storeKeySet_secondaryKeys_status_effectiveDateTime},
                ${storeKeySet_secondaryKeys_status_value}
              },
             ${storeKeySet_secondaryKeys_storeName}
            }
          ]
        },
        "totalChargesInProcess": {
                ${totalChargesInProcess_Amount},
              ${totalChargesInProcess_Currency}
        },
        "totalCreditsInProcess": {
                ${totalCreditsInProcess_Amount},
              ${totalCreditsInProcess_Currency}
        },
        "totalPaymentsInProcess": {
                ${totalPaymentsInProcess_Amount},
              ${totalPaymentsInProcess_Currency}
        },
         "links": []
          }

        }
      }
      """

  @DEV
  Scenario:1 Post an person financial account and verify Resource ID is generated with valid code
    Given variables
      | personResourceId | "personResourceId":"b7d4e0a4-92c7-4253-aff1-c5e2b689d809" |
      | tenantId         | 12345678                                                  |

    When <pfaClient> sends message <pfaPOSTRequest>
    And <pfaClient> should receive JSON message <pfaPOSTResponse>
    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicInsertResponse>
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicInsertResponse>

  @DEV
  Scenario:2 Post an person financial account with full details and verify Resource ID is generated with valid code
  and update PFA and verify the updated details along with Change topic and latest topic

    Given variables
      | personResourceId                                   | "personResourceId":"b7d4e0a4-92c7-4253-aff1-c5e2b689d809" |
      | agingBalances_amount                               | "amount":255                                              |
      | agingBalances_currency                             | "currency":"USD"                                          |
      | agingBalances_daysAged                             | "daysAged":"20"                                           |
      | collectionAgencies_1_amount                        | "amount":400                                              |
      | collectionAgencies_1_code                          | "code" :"Collection Status Code"                          |
      | collectionAgencies_1_description                   | "description":"Collection Status Description"             |
      | collectionAgencies_1_name                          | "name":"Collection Status Name"                           |
      | collectionAgencies_name                            | "name":"Agency Name"                                      |
      | collectionAgencies_sentToCollectionAgencyDate      | "sentToCollectionAgencyDate":"2018-09-11T18:06:35Z"       |
      | collectionAgencies_trackingIdentifier              | "trackingIdentifier":"TrackingId"                         |
      | collectionLetters                                  | "TEST"                                                    |
      | effectiveDateTime                                  | "effectiveDateTime":"2018-09-11T18:06:35Z"                |
      | creditorEvents_value                               | "value": "string"                                         |
      | currentBalanceAmount                               | "amount": 0,                                              |
      | currentBalanceCurrency                             | "currency":"USD"                                          |
      | orderResourceId                                    | "orderResourceId":"d16324e4-08c0-4ccd-ac23-7aa2add9702a"  |
      | debtThresholdExceededAsOf                          | "debtThresholdExceededAsOf": "2018-09-11"                 |
      | creditorEvents_effectiveDateTime                   | "effectiveDateTime":"2018-09-11T18:06:35Z"                |
      | totalChargesInProcess_Amount                       | "amount": 0                                               |
      | totalChargesInProcess_Currency                     | "currency":"USD"                                          |
      | totalCreditsInProcess_Amount                       | "amount": 0                                               |
      | totalCreditsInProcess_Currency                     | "currency":"USD"                                          |
      | totalPaymentsInProcess_Amount                      | "amount": 0                                               |
      | totalPaymentsInProcess_Currency                    | "currency":"USD"                                          |
      | lastStatementDate                                  | "lastStatementDate": "2018-09-11"                         |
      | oldestCredit_creditAmount                          | "amount": 0                                               |
      | oldestCredit_currency                              | "currency":"USD"                                          |
      | creditDate                                         | "creditDate": "2018-09-11T18:06:35Z"                      |
      | personalCeilingLimit_creditAmount                  | "amount": 0                                               |
      | personalCeilingLimit_currency                      | "currency":"USD"                                          |
      | status_effectiveDateTime                           | "effectiveDateTime":"2018-09-11T18:06:35Z"                |
      | status_value                                       | "value": "ACTIVE"                                         |
      | new_status_effectiveDateTime                       | "effectiveDateTime":"2019-11-11T11:11:11Z"                |
      | new_status_value                                   | "value": "INACTIVE"                                       |
      | storeKeySet_primaryKey_keyComponents_1_name        | "name": "string"                                          |
      | storeKeySet_primaryKey_keyComponents_1_value       | "value": "string"                                         |
      | storeKeySet_secondaryKeys_keyComponents_1_name     | "name": "string"                                          |
      | storeKeySet_secondaryKeys_keyComponents_1_value    | "value": "string"                                         |
      | storeKeySet_primaryKey_keyName                     | "keyName": "string"                                       |
      | storeKeySet_secondaryKeys_keyName                  | "keyName": "string"                                       |
      | storeKeySet_primaryKey_status_effectiveDateTime    | "effectiveDateTime":"2018-09-11T18:06:35Z"                |
      | storeKeySet_primaryKey_status_value                | "value": "string"                                         |
      | storeKeySet_secondaryKeys_status_effectiveDateTime | "effectiveDateTime":"2018-09-11T18:06:35Z"                |
      | storeKeySet_secondaryKeys_status_value             | "value": "string"                                         |
      | currentFloorLimit_baseLimit_Amount                 | "amount": 0                                               |
      | currentFloorLimit_baseLimit_Currency               | "currency":"USD"                                          |
      | currentFloorLimit_highCostLimit_Amount             | "amount": 0                                               |
      | currentFloorLimit_highCostLimit_Currency           | "currency":"USD"                                          |
      | collectionAgencies_1_currency                      | "currency":"USD"                                          |
      | storeKeySet_primaryKey_storeName                   | "storeName": "string"                                     |
      | storeKeySet_secondaryKeys_storeName                | "storeName": "string"                                     |
      | tenantId                                           | 12345678                                                  |

    When <pfaClient> sends message <pfaFullPOSTRequest>
    And <pfaClient> should receive JSON message <pfaFullPOSTResponse>

    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicInsertFullResponse>
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicInsertFullResponse>

    When <pfaClient> sends message <pfaGetRequestNewRecord>
    Then <pfaClient> should receive JSON message <pfaGetResponseNewRecord>

    When <pfaClient> sends message <pfaFullPUTRequest>
    And <pfaClient> should receive JSON message <pfaFullPUTResponse>

    And <consumerLatestTopicEndpoint> should receive JSON message <kafkaLatestTopicUpdateFullResponse>
    And <consumerChangeTopicEndpoint> should receive JSON message <kafkaChangeTopicUpdateFullResponse>

    When <pfaClient> sends message <pfaGetRequestNewRecord>
    Then <pfaClient> should receive JSON message <pfaGetResponseUpdatedRecord>

  @DEV
  Scenario:3 Post a person financial account with Person resource Id null and verify error code 400

    Given variables
      | personResourceId | "personResourceId":null |
      | tenantId         | 12345678                |

    When <pfaClient> sends message <pfaPOSTRequestBAD_REQUEST>
    And <pfaClient> should receive JSON message <pfaPOSTResponseBAD_REQUEST>

  @DEV
  Scenario:4 Post a person financial account with Person resource Id invalid and verify error code 400

    Given variables
      | personResourceId | "personResourceId":"k7d4e0a4-92c7-4253-aff1-c5e2b689d809" |
      | tenantId         | 12345678                                                  |

    When <pfaClient> sends message <pfaPOSTRequestBAD_Invalid_REQUEST>
    And <pfaClient> should receive JSON message <pfaPOSTResponseBAD_REQUEST_Invalid>