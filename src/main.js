const { SERVER_PORT } = require("./config/server")
const app = require("./app/index")

app.listen(SERVER_PORT, () => {
  console.log("coderhub服务启动在8000端口")
})