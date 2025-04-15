const userService = require("../service/user.service")
const md5password = require("../utils/md5-password")

const vertifyUser = async (ctx, next) => {
  const user = ctx.request.body
  console.log(user, "user")
  // 验证客户端传递过来的数据是否能够存储到数据库中
  const { name, password } = user
  if (!name || !password) {
    return ctx.app.emit("error", "name_password_is_required", ctx)
  }
  // 判断用户在数据库中是否已经存在
  const users = await userService.findUserByName(name)
  if (users.length) {
    ctx.body = {
      code: '-1002',
      message: "用户名已经被占用~"
    }
    return ctx.app.emit("error", "name_is_already_exists", ctx)
  }

  await next()
}


// 对用户密码进行加密
const handlePassword = async (ctx, next) => {
  // 1.取出我们的密码
  const { password } = ctx.request.body
  // 2. 对密码进行加密
  ctx.request.body.password = md5password(password)
  await next()
}

module.exports = {
  vertifyUser,
  handlePassword,
}