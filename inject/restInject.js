module.exports = function(request, state, logger) {
    logger.debug('Received request:', request);
    return {
        statusCode: 200,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message: 'Success' })
    };
};
