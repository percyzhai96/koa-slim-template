const KoaRouter = require("@koa/router")
const { create, showAvatarImg } = require("../controller/user.controller")
const { vertifyUser, handlePassword } = require("../middleware/user.middleware")
const userRouter = new KoaRouter({ prefix: '/users' })
// 用户注册接口
userRouter.post("/", vertifyUser, handlePassword, create)
// 为用户提供头像展示
userRouter.get("/avatar/:userId", showAvatarImg)

// 导出路由
module.exports = userRouter