const { NAME_PASSWORD_IS_REQUIRED, NAME_IS_NOT_EXISTS, PASSWORD_IS_INCORRENT, UNAUTHORITION } = require("../config/error")
const userService = require("../service/user.service")
const md5password = require("../utils/md5-password")
const jwt = require("jsonwebtoken")
const { PUBLIC_KEY } = require("../config/screct")

const verifyLogin = async (ctx, next) => {
  const { name, password } = ctx.request.body
  if (!name || !password) {
    return ctx.app.emit('error', NAME_PASSWORD_IS_REQUIRED, ctx)
  }

  const users = await userService.findUserByName(name)
  const user = users[0]

  if (!user) {
    return ctx.app.emit('error', NAME_IS_NOT_EXISTS, ctx)
  }

  if (user.password !== md5password(password)) {
    return ctx.app.emit("error", PASSWORD_IS_INCORRENT, ctx)
  }
  // 将查询的用户信息存储在ctx中
  ctx.user = user

  await next()
}

// 验证token
const verifyAuth = async (ctx, next) => {
  const authorization = ctx.header.authorization
  const token = authorization.replace("Bearer ", "")
  try {
    const result = jwt.verify(token, PUBLIC_KEY, { algorithms: ['RS256'] })
    // 保存token信息
    ctx.user = result
    await next()
  } catch (error) {
    return ctx.app.emit("error", UNAUTHORITION, ctx)
  }
}

module.exports = {
  verifyLogin,
  verifyAuth
}