const connection = require("../app/database")

class MomentService {
  async create (content, userId) {
    const statement = "INSERT INTO `moment` (content,user_id) VALUES (?,?);"
    const [result] = await connection.execute(statement, [content, userId])
    return result
  }

  // 查询详情列表
  async queryList (offset = 0, size = 10) {
    const statement = `
    SELECT
    m.id AS id, m.content AS content,m.createAt AS createTime, m.updateAt AS updateTime,
    JSON_OBJECT('id',u.id,'name',u.name,'createTime',u.createAt,'updateTime',u.updateAt) AS user
    FROM moment AS m LEFT JOIN user AS u ON  u.id = m.user_id LIMIT ? OFFSET ?;
    `
    const result = await connection.execute(statement, [String(size), String(offset)])
    return result
  }

  // 查询具体详情
  async queryById (momentId) {
    const statement = `
    SELECT
    m.id AS id, m.content AS content,m.createAt AS createTime, m.updateAt AS updateTime,
    JSON_OBJECT('id',u.id,'name',u.name,'createTime',u.createAt,'updateTime',u.updateAt) AS user
    FROM moment AS m LEFT JOIN user AS u ON  u.id = m.user_id WHERE m.id = ?;
    `
    const [result] = await connection.execute(statement, [momentId])
    return result

  }

  // 更改动态
  async update (content, id) {
    const statement = `UPDATE moment SET content = ? WHERE id = ?;`
    const [result] = await connection.execute(statement, [content, id])
    return result
  }
}

module.exports = new MomentService()

