const momentService = require("../service/moment.service")

class MomentController {
  async create (ctx, next) {
    const { content } = ctx.request.body
    // 动态由谁发布
    const { id } = ctx.user
    const result = await momentService.create(content, id)
    ctx.body = {
      code: 0,
      message: "创建用户动态成功",
      data: result
    }
  }
}


module.exports = new MomentController()