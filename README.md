# koa-slim-template

一个基于 **Koa2** 打造的轻量级后端服务项目，实现了类社区/社交平台的常用接口能力：用户注册登录、发布动态（moment）、评论与回复、标签管理、头像上传等。

采用经典的分层架构（路由 → 中间件 → 控制器 → Service → 数据库），并支持**路由自动化注册**，方便扩展新功能模块。

---

## 技术栈

| 类别 | 技术 |
| --- | --- |
| 运行环境 | Node.js |
| Web 框架 | Koa2（`koa@2.x`） |
| 路由 | `@koa/router` |
| 请求体解析 | `koa-bodyparser` |
| 文件上传 | `@koa/multer` + `multer` |
| 数据库 | MySQL（`mysql2` 连接池） |
| 身份认证 | `jsonwebtoken`（RS256 非对称加密） |
| 配置管理 | `dotenv` |
| 密码加密 | `crypto`（MD5） |
| 开发调试 | `nodemon` |

---

## 功能特性

- ✅ 用户注册（密码 MD5 加密存储）
- ✅ 用户登录（签发 JWT Token，有效期 24 小时）
- ✅ 发布 / 查询 / 详情 / 修改 / 删除动态（支持分页查询）
- ✅ 动态绑定标签（标签不存在时自动创建）
- ✅ 发表评论、回复评论
- ✅ 头像上传与展示
- ✅ JWT 登录认证中间件
- ✅ 操作权限校验中间件
- ✅ 全局统一错误处理
- ✅ 路由自动化注册

---

## 目录结构

```
koa-slim-template/
├── db/
│   └── coderhub.sql              # 数据库初始化脚本
├── src/
│   ├── main.js                   # 项目入口，启动服务
│   ├── app/
│   │   ├── index.js              # 创建 Koa 实例，注册中间件与路由
│   │   └── database.js           # MySQL 连接池配置
│   ├── config/
│   │   ├── server.js             # 读取 .env 中的服务配置
│   │   ├── error.js              # 错误类型常量
│   │   ├── path.js               # 上传目录等路径配置
│   │   ├── screct.js             # 读取 RSA 公私钥
│   │   └── keys/                 # JWT 签名用的公私钥（.pem）
│   ├── router/                   # 路由定义（*.router.js 自动注册）
│   ├── controller/               # 控制器层：处理请求与响应
│   ├── service/                  # Service 层：封装数据库操作
│   ├── middleware/               # 中间件层：认证、校验、上传等
│   └── utils/                    # 工具函数（错误监听、MD5 加密）
├── .env                          # 环境变量配置
├── package.json
└── README.md
```

### 分层架构说明

```
客户端请求
   │
   ▼
Router（路由分发）
   │
   ▼
Middleware（中间件：认证 / 权限 / 参数校验 / 文件处理）
   │
   ▼
Controller（控制器：参数处理、响应返回）
   │
   ▼
Service（业务层：SQL 查询、数据库交互）
   │
   ▼
MySQL（mysql2 连接池）
```

> 路由自动化注册：`src/router/index.js` 会自动扫描目录下所有 `*.router.js` 文件并注册，新增模块无需手动挂载。

---

## 环境准备

- Node.js（建议 14+）
- MySQL 8.x（本地需创建 `coderhub` 数据库，或导入 `db/coderhub.sql`）

---

## 快速开始

### 1. 克隆项目并安装依赖

```bash
git clone <仓库地址>
cd koa-slim-template
npm install
```

### 2. 初始化数据库

- 方式一：在 MySQL 中执行 `db/coderhub.sql` 脚本，自动创建 `coderhub` 数据库及全部数据表。
- 方式二：手动创建数据库并执行建表语句：

```sql
CREATE DATABASE coderhub DEFAULT CHARACTER SET utf8mb4;
```

### 3. 修改数据库连接配置

编辑 `src/app/database.js`，将数据库连接信息改为你的本地配置：

```js
const connectionPool = mysql.createPool({
  host: "localhost",
  port: 3306,
  database: "coderhub",
  user: "root",
  password: "root",   // 改为你的 MySQL 密码
  connectionLimit: 5,
})
```

### 4. 配置环境变量

编辑 `.env`（默认已提供）：

```env
SERVER_PORT = 8000
SERVER_HOST = http://localhost
```

### 5. 启动服务

```bash
# 开发模式（nodemon 热更新）
npm run dev

# 生产模式
npm start
```

启动成功后控制台输出：

```
和数据库交互成功~
coderhub服务启动在8000端口
```

> 提示：JWT 签名使用了非对称密钥（`src/config/keys/` 下的 `private_key.pem` 与 `public_key.pem`），请勿泄露私钥。如需更换，可在该目录重新生成 RSA 密钥对。

---

## 数据库表结构

| 表名 | 说明 |
| --- | --- |
| `user` | 用户表（含 `avatar_url` 头像地址） |
| `moment` | 动态表（内容 + 发布用户） |
| `comment` | 评论表（支持一级评论与回复，通过 `comment_id` 关联） |
| `label` | 标签表 |
| `moment_label` | 动态-标签多对多关系表 |
| `avatar` | 头像文件信息表 |

---

## API 接口文档

> 统一返回格式：`{ code, message, data }`
> 认证方式：在请求头携带 `Authorization: Bearer <token>`

### 用户模块

| 方法 | 路径 | 说明 | 认证 |
| --- | --- | --- | --- |
| POST | `/users` | 用户注册（`name`、`password`） | 否 |
| GET | `/users/avatar/:userId` | 展示用户头像 | 否 |

### 登录模块

| 方法 | 路径 | 说明 | 认证 |
| --- | --- | --- | --- |
| POST | `/login` | 用户登录（`name`、`password`），返回 Token | 否 |

### 动态模块

| 方法 | 路径 | 说明 | 认证 |
| --- | --- | --- | --- |
| POST | `/moment` | 创建动态（`content`） | ✅ |
| GET | `/moment?offset=0&size=10` | 查询动态列表（分页） | 否 |
| GET | `/moment/:momentId` | 查询动态详情（含评论、标签） | 否 |
| PATCH | `/moment/:momentId` | 修改动态（`content`） | ✅ + 权限 |
| DELETE | `/moment/:momentId` | 删除动态 | ✅ + 权限 |
| POST | `/moment/:momentId/lables` | 为动态添加标签（`lables: []`） | ✅ + 权限 |

### 评论模块

| 方法 | 路径 | 说明 | 认证 |
| --- | --- | --- | --- |
| POST | `/comment` | 发表评论（`content`、`momentId`） | ✅ |
| POST | `/comment/replay` | 回复评论（`content`、`momentId`、`commentId`） | ✅ |

### 标签模块

| 方法 | 路径 | 说明 | 认证 |
| --- | --- | --- | --- |
| POST | `/label` | 创建标签（`name`） | ✅ |

### 文件模块

| 方法 | 路径 | 说明 | 认证 |
| --- | --- | --- | --- |
| POST | `/file/avatar` | 上传头像（`multipart/form-data`，字段名 `avatar`） | ✅ |

### 错误码

| 错误码 | 说明 |
| --- | --- |
| `-1001` | 用户名或密码不能为空 |
| `-1002` | 用户名已被占用 |
| `-1003` | 登录的用户名不存在 |
| `-1004` | 输入的密码错误 |
| `-1005` | 接口未认证（Token 缺失或无效） |
| `-2001` | 没有操作该资源的权限 |

---

## 常见问题

**Q：启动时报数据库连接失败？**
请检查 MySQL 服务是否启动、`src/app/database.js` 中的账号密码、`coderhub` 数据库是否已创建。

**Q：上传图片后无法展示头像？**
请确认 `uploads/` 目录存在（`multer` 会自动创建），且 `.env` 中的 `SERVER_HOST` 配置正确。

---

## License

ISC
