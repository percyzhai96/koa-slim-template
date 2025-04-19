const commentService = require("../service/comment.service")

class CommentController {
  async create (ctx, next) {
    // 获取body中的参数
    const { content, momentId } = ctx.request.body
    const { id } = ctx.user
    const result = await commentService.create(content, momentId, id)
    ctx.body = {
      code: 0,
      message: '发表评论成功~',
      data: result
    }
  }

  async replay (ctx, next) {
    const { content, momentId, commentId } = ctx.request.body
    const { id } = ctx.user
    const result = await commentService.replay(content, momentId, commentId, id)
    ctx.body = {
      code: 0,
      message: '回复评论成功~',
      data: result
    }
  }
}

module.exports = new CommentController()