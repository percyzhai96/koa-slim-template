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

  // 查询用户列表
  async list (ctx, next) {
    const { offset, size } = ctx.query
    const [result] = await momentService.queryList(offset, size)
    ctx.body = {
      code: 0,
      message: "查询动态列表成功！",
      data: result
    }
  }

  // 查询用户列表想详情
  async detail (ctx, next) {
    // 获取动态id
    const { momentId } = ctx.params
    // 根据id查询具体详情
    const result = await momentService.queryById(momentId)
    ctx.body = {
      code: 0,
      message: "查询动态列表详情成功！",
      data: result
    }
  }

  //修改动态
  async update (ctx, next) {
    const { momentId } = ctx.params
    const { content } = ctx.request.body
    const result = await momentService.update(content, momentId)
    ctx.body = {
      code: 0,
      message: "动态修改成功！",
      data: result
    }

  }
}


module.exports = new MomentController()