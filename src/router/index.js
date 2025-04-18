const fs = require("fs")

/**
 * @method registerRoutes 路由自动化注册
 * @param {*} app 
 */
function registerRoutes (app) {
  const files = fs.readdirSync(__dirname)
  // 遍历所有的文件
  for (const file of files) {
    if (!file.endsWith('.router.js')) continue
    const router = require(`./${file}`)
    app.use(router.routes())
    app.use(router.allowedMethods())
  }
}

module.exports = registerRoutes