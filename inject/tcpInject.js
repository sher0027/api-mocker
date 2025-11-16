module.exports = function(request, state, logger) {
    logger.debug('Received request:', request);
    return {
        data: "TCP response"
    };
};
