const KoaRouter = require("@koa/router")
const { handleAvatar } = require("../middleware/file.middleware")
const { verifyAuth } = require("../middleware/login.middleware")
const { create } = require("../controller/file.controller")
const fileRouter = new KoaRouter({ prefix: '/file' })

// 上传头像
fileRouter.post("/avatar", verifyAuth, handleAvatar, create)


module.exports = fileRouter