const Koa = require("koa")
const useRouter = require("../router/user.router")

const app = new Koa()

app.use(useRouter.routes())
app.use(useRouter.allowedMethods())

module.exports = app