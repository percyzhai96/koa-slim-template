const dotenv = require("dotenv")

// 使用dotenv的配置,获取主进程配置
dotenv.config()

module.exports = {
  SERVER_PORT,
  SERVER_HOST
} = process.env