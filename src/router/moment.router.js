const KoaRouter = require("@koa/router")
const momentRouter = new KoaRouter({ prefix: '/moment' })
const { verifyAuth } = require("../middleware/login.middleware")
const { create } = require("../controller/moment.controller")

// 编写接口，创建动态
momentRouter.post("/", verifyAuth, create)

module.exports = momentRouter