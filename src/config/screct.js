const fs = require("fs")
const path = require("path")

const PRIVATE_KEY = fs.readFileSync(path.resolve(__dirname, "./keys/private_key.pem"))
const PUBLIC_KEY = fs.readFileSync(path.resolve(__dirname, "./keys/public_key.pem"))

module.exports = {
  PRIVATE_KEY,
  PUBLIC_KEY
}