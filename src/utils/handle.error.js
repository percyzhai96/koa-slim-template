const app = require("../app")
const { NAME_PASSWORD_IS_REQUIRED, NAME_IS_ALREADY_EXISTS, NAME_IS_NOT_EXISTS, PASSWORD_IS_INCORRENT } = require("../config/error")

app.on("error", (error, ctx) => {
  let code = 0
  let message = ''
  switch (error) {
    case NAME_PASSWORD_IS_REQUIRED:
      code = -1001
      message = "用户名或密码不能为空！"
      break
    case NAME_IS_ALREADY_EXISTS:
      code = -1002
      message = "用户名已经被占用，请输入新的用户名~"
      break
    case NAME_IS_NOT_EXISTS:
      code = -1003
      message = "登录的用户名不存在，请检测用户名~"
      break
    case PASSWORD_IS_INCORRENT:
      code = -1004
      message = "输入的密码错误，请检查密码~"
      break
    case UNAUTHORITION:
      code = -1005
      message = "接口未认证~"
  }
  ctx.body = { code, message }
})

