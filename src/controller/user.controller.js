const userService = require("../service/user.service")
const fileService = require("../service/file.service")
const fs = require("fs")
const { UPLOAD_PATH } = require("../config/path")


class UserController {

  async create (ctx, next) {
    // 将user信息存储进数据库
    const user = ctx.request.body
    const result = await userService.create(user)
    ctx.body = {
      message: "创建用户成功~",
      data: result
    }
  }

  // 展示用户的头像
  async showAvatarImg (ctx, next) {
    const { userId } = ctx.params
    // 获取用户头像信息
    const result = await fileService.queryAvatarWithUserId(userId)
    // 读取头像所在的文件
    const { filename, mimetype } = result
    ctx.type = mimetype
    ctx.body = fs.createReadStream(`${UPLOAD_PATH}/${filename}`)
  }

}

module.exports = new UserController()