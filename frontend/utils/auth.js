var cookie = require('vue-cookies')

function authentication() {
    if (cookie.get("Token")) {
        return true
    } else {
        return false
    }
}

module.exports.authentication = authentication;