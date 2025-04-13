const KoaRouter = require("@koa/router")

const useRouter = new KoaRouter({ prefix: '/users' })

useRouter.get("/list", (ctx, next) => {
  ctx.body = "接口请求成功！"
})

// 导出路由
module.exports = useRouter