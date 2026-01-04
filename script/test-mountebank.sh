#!/bin/bash

# Test REST (HTTP GET) on port 4545
echo "Testing REST response on port 4545..."
rest_response=$(curl -s -o /dev/null -w "%{http_code}" -X GET "http://localhost:4545/api/test")
if [ "$rest_response" -eq 200 ]; then
  echo "REST Test Passed: Received 200 OK"
else
  echo "REST Test Failed: Received $rest_response"
fi

# Test SOAP (HTTP POST) on port 4545
echo "Testing SOAP response on port 4545..."
soap_response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "http://localhost:4545/soap/test" \
  -H "Content-Type: text/xml" \
  -d '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body><TestRequest/></soapenv:Body></soapenv:Envelope>')
if [ "$soap_response" -eq 200 ]; then
  echo "SOAP Test Passed: Received 200 OK"
else
  echo "SOAP Test Failed: Received $soap_response"
fi

# Test TCP on port 4546
echo "Testing TCP response on port 4546..."
tcp_response=$(echo -n "hello" | nc -w 3 localhost 4546)

if [ "$tcp_response" = "TCP response" ]; then
  echo "TCP Test Passed: Received 'TCP response'"
else
  echo "TCP Test Failed: Received '$tcp_response'"
fi
