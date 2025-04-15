const KoaRouter = require("@koa/router")
const userController = require("../controller/user.controller")
const { vertifyUser, handlePassword } = require("../middleware/user.middleware")
const userRouter = new KoaRouter({ prefix: '/users' })
// 用户注册接口
userRouter.post("/", vertifyUser, handlePassword, userController.create)

// 导出路由
module.exports = userRouter