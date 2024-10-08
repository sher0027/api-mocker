module.exports = function(request, state, logger) {
    logger.debug('Received request:', request);
    const soapResponse = `
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
        <soapenv:Body>
            <TestResponse>Success</TestResponse>
        </soapenv:Body>
    </soapenv:Envelope>`;

    return {
        statusCode: 200,
        headers: {
            "Content-Type": "text/xml"
        },
        body: soapResponse
    };
};
