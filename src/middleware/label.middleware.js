const labelService = require("../service/label.service")

const verifyLabelExists = async (ctx, next) => {
  const { lables } = ctx.request.body
  // 判断所有的labels中的name是否已经存在label这张表中
  const newLables = []
  for (const name of lables) {
    const result = await labelService.queryLabelByName(name)
    const labelObj = {}
    if (result) {
      // 获取name和对相应的id
      labelObj.id = result.id
    } else {
      // 获取name并且获取插入后的id
      const insertResult = await labelService.create(name)
      labelObj.id = insertResult.insertId
    }
    newLables.push(labelObj)
  }

  ctx.labels = newLables
  await next()
}

module.exports = {
  verifyLabelExists
}