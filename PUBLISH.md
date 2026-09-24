# 项目需求看板 · GitHub Pages 发布说明

部署包已生成在 `ghpages/` 目录，包含 9 个文件（已剔除 CloudStudio 残留属性、不含备份/死文件）：

- `index.html`（看板主程序，v3.99）
- `sw.js`（Service Worker，缓存版本 `kanban-project-v61`）
- `manifest.json`（PWA 清单）
- `app-192.png` / `app-512.png` / `app-maskable-512.png` / `app-icon.svg` / `favicon-32.png` / `favicon.svg`

目标仓库：`github.com/Viola1203/Projects`
发布分支：`gh-pages`（独立分支，不污染仓库现有的 main 分支）
访问地址：`https://Viola1203.github.io/Projects/`

---

## 方式 A：GitHub 网页拖拽上传（最简单，无需 Git）

1. 打开仓库 `https://github.com/Viola1203/Projects`
2. 点 **Branch** 下拉 → 输入 `gh-pages` → **Create branch: gh-pages**
3. 切到 `gh-pages` 分支后，点 **Add file → Upload files**，把本目录 9 个文件全选拖进去
4. 提交（Commit）
5. 进入 **Settings → Pages**，Source 选 `Deploy from a branch` → 分支 `gh-pages` / 目录 `(root)` → Save
6. 1~2 分钟后访问 `https://Viola1203.github.io/Projects/`

## 方式 B：本地 Git（已配 `publish.bat`）

1. 在本 `ghpages/` 文件夹里双击 `publish.bat`（或在 Git Bash 运行 `./publish.bat`）
2. 首次推送按提示输入 **GitHub 用户名** 和 **Personal Access Token**（ token 需勾选 `repo` 权限；密码已不可用）
3. 推送后同样到 **Settings → Pages** 把 Source 设为 `gh-pages` / `(root)`

> 若本机装了 GitHub CLI（`gh`），也可：`gh repo clone Viola1203/Projects`，把文件拷进去后正常 `git add/commit/push`，但本脚本已足够。

---

## 开启 Pages 后

- 私有仓库的 Pages 站点**仍公网可访问**（GitHub 机制如此）；但看板数据存在你浏览器本地 `localStorage`（前缀 `wb_prm_`），服务器不存任何业务数据，故公开站点不会泄露内容。
- 首次访问建议 **Ctrl+Shift+R 硬刷新**，让 SW `v61` 接管缓存。

## 一次性数据迁移（CloudStudio → GitHub）

看板数据绑定来源域名，切到 `github.io` 后旧数据不会自动跟随：

1. 在 **旧站（CloudStudio）** 打开看板 → 设置 → 导出数据（JSON）
2. 在 **新站（github.io）** 打开 → 设置 → 导入该 JSON

个人自用只需导一次。

## 后续更新流程

代码改动 → 主文件 `项目需求看板_V1.html` → 同步 `webroot/index.html`（已做）→ 重新生成 `ghpages/`（删除旧文件、重跑本目录的生成命令）→ 再推 `gh-pages`。

> 注意：每次发布若改了看板逻辑，记得把 `sw.js` 的 `CACHE` 版本号 +1（当前 `v61`），否则用户端不会拉取新版本。
