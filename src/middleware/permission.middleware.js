const permissionService = require("../service/permission.service")
const { OPERATION_IS_ALLOWED } = require("../config/error")
const verifyPermission = async (ctx, next) => {
  const { id } = ctx.user
  // 获取资源的id
  const keyName = Object.keys(ctx.params)[0]
  const resourceId = ctx.params[keyName]
  const resourceName = keyName.replace('Id', '')
  // 查询数据表，查看是否有权限
  const isPermission = await permissionService.checkResource(resourceName, resourceId, id)
  if (!isPermission) {
    ctx.app.emit("error", OPERATION_IS_ALLOWED, ctx)
  } else {
    await next()
  }
}


module.exports = {
  verifyPermission
}