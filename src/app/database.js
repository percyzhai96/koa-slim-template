const mysql = require("mysql2")
const connectionPool = mysql.createPool({
  host: "localhost",
  port: 3306,
  database: "coderhub",
  user: "root",
  password: "root",
  connectionLimit: 5,
})
connectionPool.getConnection((err, connection) => {
  if (err) {
    console.log("数据库连接失败~", err)
    return
  }
  // 获取connection，尝试与数据库连接
  connection.connect(err => {
    if (err) {
      console.log("和数据库交互失败", err)
    } else {
      console.log("和数据库交互成功~")
    }
  })
})

// 获取连接池中的连接对象
const connection = connectionPool.promise()
module.exports = connection