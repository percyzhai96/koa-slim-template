const { SERVER_PORT } = require("./config/server")
const app = require("./app")
require("./utils/handle.error") // 监听错误

app.listen(SERVER_PORT, () => {
  console.log("coderhub服务启动在8000端口")
})