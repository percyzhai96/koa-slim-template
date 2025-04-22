class FileController {
  async create (ctx, next) {
    console.log(ctx.request.file, "文件上传内容###")
    ctx.body = '文件上传成功'
  }

}


module.exports = new FileController()