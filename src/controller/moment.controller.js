class MomentController {
  async create (ctx, next) {
    const { content } = ctx.request.body
    const { id } = ctx.user
    ctx.body = "发表成功！"
  }
}


module.exports = new MomentController()