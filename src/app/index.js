const Koa = require("koa")
const bodyParser = require("koa-bodyparser")
const registerRoutes = require("../router/index")

const app = new Koa()
app.use(bodyParser())
registerRoutes(app) // 自动化注册路由

module.exports = app