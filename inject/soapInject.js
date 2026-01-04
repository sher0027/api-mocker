const path = require('path');
const fs = require('fs');

module.exports = function (request, state, logger) {
    logger.debug('Received request');

    return {
        statusCode: 200,
        headers: { 'Content-Type': 'text/xml' },
        body: fs.readFileSync(path.join(__dirname, '../payload/soap/soap-response.xml'), 'utf8')
    };
};
