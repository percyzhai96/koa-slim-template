const Koa = require("koa")
const bodyParser = require("koa-bodyparser")
const registerRoutes = require("../router/index")

const app = new Koa()
registerRoutes(app) // 自动化注册路由
app.use(bodyParser())

module.exports = app