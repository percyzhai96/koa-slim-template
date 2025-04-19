const permissionService = require("../service/permission.service")
const { OPERATION_IS_ALLOWED } = require("../config/error")
const verifyPermission = async (ctx, next) => {
  const { id } = ctx.user
  const { momentId } = ctx.params
  // 查询数据表，查看是否有权限
  const isPermission = await permissionService.checkMoment(momentId, id)
  if (!isPermission) {
    ctx.app.emit("error", OPERATION_IS_ALLOWED, ctx)
  } else {
    await next()
  }

}
module.exports = {
  verifyPermission
}