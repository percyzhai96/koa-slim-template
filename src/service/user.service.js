const connection = require("../app/database")

class UserService {
  // 创建用户
  async create (user) {
    const { name, password } = user
    const statement = 'INSERT INTO `user` (name,password) VALUES (?,?);'
    const result = await connection.execute(statement, [name, password])
    return result
  }
  // 根据用户名查询
  async findUserByName (name) {
    const statement = "SELECT * FROM `user` WHERE name = ?;"
    const result = await connection.execute(statement, [name])
    return result[0]
  }

  // 
  async updateUserAvatar (avatarUrl, userId) {
    const statement = 'UPDATE user SET avatar_url=? WHERE id=?;'
    const [result] = await connection.execute(statement, [avatarUrl, userId])
    return result
  }
}

module.exports = new UserService()