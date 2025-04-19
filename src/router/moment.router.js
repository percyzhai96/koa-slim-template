const KoaRouter = require("@koa/router")
const momentRouter = new KoaRouter({ prefix: '/moment' })
const { verifyAuth } = require("../middleware/login.middleware")
const { create, list, detail, update, remove } = require("../controller/moment.controller")
const { verifyPermission } = require("../middleware/permission.middleware")

// 编写接口，创建动态
momentRouter.post("/", verifyAuth, create)
// 查询动态
momentRouter.get("/", list)
// 查询动态详情
momentRouter.get("/:momentId", detail)
// 删除动态
momentRouter.delete("/:momentId", verifyAuth, verifyPermission, remove)
// 修改动态:登录的用户才能修改动态
momentRouter.patch("/:momentId", verifyAuth, verifyPermission, update)

module.exports = momentRouter