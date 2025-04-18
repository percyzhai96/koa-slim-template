const jwt = require("jsonwebtoken")
const { PRIVATE_KEY } = require("../config/screct")

class LoginController {
  sign (ctx, next) {
    const { id, name } = ctx.user
    // 颁发token
    const token = jwt.sign({ id, name }, PRIVATE_KEY, {
      expiresIn: 24 * 60 * 60,
      algorithm: "RS256"
    })

    ctx.body = { code: 0, data: { token, id, name } }
  }
}

module.exports = new LoginController()