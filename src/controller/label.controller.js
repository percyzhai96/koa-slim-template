const labelService = require("../service/label.service")

class LabelController {
  async create (ctx, next) {
    const { name } = ctx.request.body
    // 操作数据库进行存储
    const result = await labelService.create(name)
    ctx.body = {
      code: 0,
      message: '创建标签成功！',
      result
    }

  }
}

module.exports = new LabelController()