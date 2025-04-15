const crypto = require("crypto")

function md5password (password) {
  const md5 = crypto.createHash('md5') // 创建md5加密算法
  const md5pwd = md5.update(password).digest('hex') // 加密转为16进制
  return md5pwd
}

module.exports = md5password