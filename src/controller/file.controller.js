const fileService = require("../service/file.service")
const userService = require("../service/user.service")
const { SERVER_PORT, SERVER_HOST } = require("../config/server")

class FileController {
  async create (ctx, next) {
    const { filename, mimetype, size } = ctx.request.file
    const { id } = ctx.user
    // 将头像信息进行存储
    await fileService.create(filename, mimetype, size, id)
    // 将头像的信息保存在user表中
    const avatarUrl = `${SERVER_HOST}:${SERVER_PORT}/users/avatar/${id}`
    await userService.updateUserAvatar(avatarUrl, id)

    ctx.body = {
      code: 0,
      message: '头像上传成功，可以查看~',
      avatarUrl
    }
  }

}


module.exports = new FileController()