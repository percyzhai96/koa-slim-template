const KoaRouter = require("@koa/router")
const { verifyAuth } = require('../middleware/login.middleware')
const { create, replay } = require("../controller/comment.controller")
const commentRouter = new KoaRouter({ prefix: '/comment' })

// 增：新增评论
commentRouter.post('/', verifyAuth, create)
// 回复评论
commentRouter.post('/replay', verifyAuth, replay)


module.exports = commentRouter