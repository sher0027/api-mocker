#!/bin/bash

PORT=1080

# Configure REST response
curl -v -X PUT "http://localhost:$PORT/expectation" -d '{
  "httpRequest": {
    "method": "GET",
    "path": "/api/test"
  },
  "httpResponse": {
    "statusCode": 200,
    "body": "{\"message\": \"Success\"}",
    "headers": {
      "Content-Type": "application/json"
    }
  }
}'

# Configure SOAP response
curl -v -X PUT "http://localhost:$PORT/expectation" -d '{
  "httpRequest": {
    "method": "POST",
    "path": "/soap/test",
    "headers": {
      "Content-Type": ["text/xml"]
    }
  },
  "httpResponse": {
    "statusCode": 200,
    "body": "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\"><soapenv:Body><TestResponse>Success</TestResponse></soapenv:Body></soapenv:Envelope>",
    "headers": {
      "Content-Type": "text/xml"
    }
  }
}'
