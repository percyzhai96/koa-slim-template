const app = require("../app")

app.on("error", (error, ctx) => {
  console.log(error, "打印错误")

  let code = 0
  let message = ''
  switch (error) {
    case 'name_password_is_required':
      code = -1001
      message = "用户名或密码不能为空！"
      break

  }
  ctx.body = { code, message }
})

