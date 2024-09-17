#!/bin/bash

PORT=1080
TCP_PORT=4545

# Test REST response
echo "Testing REST response..."
rest_response=$(curl -s -o /dev/null -w "%{http_code}" -X GET "http://localhost:$PORT/api/test")
if [ "$rest_response" -eq 200 ]; then
  echo "REST Test Passed: Received 200 OK"
else
  echo "REST Test Failed: Received $rest_response"
fi

# Test SOAP response
echo "Testing SOAP response..."
soap_response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "http://localhost:$PORT/soap/test" \
  -H "Content-Type: text/xml" \
  -d '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body><TestRequest/></soapenv:Body></soapenv:Envelope>')
if [ "$soap_response" -eq 200 ]; then
  echo "SOAP Test Passed: Received 200 OK"
else
  echo "SOAP Test Failed: Received $soap_response"
fi

# Test TCP response
echo "Testing TCP response through Mountebank..."
tcp_response=$(echo -n "hello" | nc -w 3 localhost 4546)

if [ "$tcp_response" = "TCP response" ]; then
  echo "TCP Test Passed: Received 'TCP response' from MockServer"
else
  echo "TCP Test Failed: Received '$tcp_response'"
fi