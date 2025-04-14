const userService = require("../service/user.service")

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
    return
  }
  // 执行下一个中间件(写不写await无所谓)
  await next()
}

module.exports = vertifyUser