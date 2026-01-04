const path = require('path');
const fs = require('fs');

module.exports = function(request, state, logger) {
    logger.debug('Received request:', request);
 
    return {
        data: fs.readFileSync(path.join(__dirname, '../payload/tcp/tcp-response.txt'), 'utf8')
    };
};
