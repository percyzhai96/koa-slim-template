const KoaRouter = require("@koa/router")
const lableRouter = new KoaRouter({ prefix: '/label' })
const { create } = require("../controller/label.controller")
const { verifyAuth } = require("../middleware/login.middleware")


lableRouter.post("/", verifyAuth, create)

module.exports = lableRouter