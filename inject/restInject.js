const path = require('path');

module.exports = function (request, state, logger) {
    logger.debug('Received request');

    return {
        statusCode: 200,
        headers: { 'Content-Type': 'application/json' },
        body: require(path.join(__dirname, '../payload/rest/rest-response.json'))
    };
};
