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

  // 删除某条动态
  async remove (ctx, next) {
    const { momentId } = ctx.params
    const result = await momentService.remove(momentId)
    ctx.body = {
      code: 0,
      message: "删除动态修改成功！",
      data: result
    }
  }

  // 给动态添加标签
  async addLabels (ctx, next) {
    // 获取参数
    const labels = ctx.labels
    const { momentId } = ctx.params
    try {
      for (const label of labels) {
        const isExists = await momentService.hasLabel(momentId, label.id)
        if (!isExists) {
          // 不存在关系数据进行插入
          await momentService.addLabel(momentId, label.id)
        }
      }
      ctx.body = {
        code: 0,
        message: '为动态添加标签成功！'
      }
    } catch (error) {
      console.log(error)
      ctx.body = {
        code: -3001,
        message: '为动态添加标签失败！'
      }
    }
  }


}


module.exports = new MomentController()