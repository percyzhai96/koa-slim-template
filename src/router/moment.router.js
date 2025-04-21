const KoaRouter = require("@koa/router")
const momentRouter = new KoaRouter({ prefix: '/moment' })
const { verifyAuth } = require("../middleware/login.middleware")
const { verifyLabelExists } = require("../middleware/label.middleware")
const { create, list, detail, update, remove, addLabels } = require("../controller/moment.controller")
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

/**
   * 1.验证是否登录
   * 2.验证是否有操作这个动态的权限
   * 3.额外中间件，验证label的name是否已经存在label表中
   *  *如果存在，那么直接使用即可
   *  *如果没有存在，那么需要先讲将label的name添加到lable表
   * 4.所有的label都已经在label表，动态和label的关系添加到关系表中
   */
momentRouter.post("/:momentId/lables", verifyAuth, verifyPermission, verifyLabelExists, addLabels)

module.exports = momentRouter