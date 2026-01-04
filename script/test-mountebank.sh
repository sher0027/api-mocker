#!/bin/bash

# -----------------------------
# Test REST (HTTP GET) on port 4545
# -----------------------------
echo "Testing REST response on port 4545..."
rest_response=$(curl -s -X GET "http://localhost:4545/rest/test")
echo "REST response:"
echo "$rest_response"

# -----------------------------
# Test SOAP (HTTP POST) on port 4545
# -----------------------------
echo "Testing SOAP response on port 4545..."
soap_response=$(curl -s -X POST "http://localhost:4545/soap/test" \
  -H "Content-Type: text/xml" \
  -d '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body><TestRequest/></soapenv:Body></soapenv:Envelope>')
echo "SOAP response:"
echo "$soap_response"

# -----------------------------
# Test TCP on port 4546
# -----------------------------
echo "Testing TCP response on port 4546..."
tcp_response=$(echo -n "hello" | nc -w 3 localhost 4546)

echo "TCP response:"
echo "$tcp_response"
