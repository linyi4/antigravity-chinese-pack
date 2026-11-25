# Antigravity 中文汉化包（Simplified Chinese Pack）

把 Google Antigravity 桌面客户端变成**全中文界面**：菜单、设置、弹窗、托盘、向导、登录页、伴生面板，一次性全翻。

- **不用装 Node.js**：脚本借客户端自带的 Electron 运行
- **一键装 / 一键还原**：改之前自动备份 `app.asar`
- **不联网、不上传**：全部本地处理，只改界面文案，不动你的账号和项目
- **适配版本**：Antigravity Desktop **2.35.x**（Windows）

---

## 效果

| 位置 | 汉化后 |
|---|---|
| 标题栏 | 反重力智能编程 |
| 侧边栏 | 新建会话 / 自动化 / 个性化定制 / 项目列表 |
| 欢迎页 | 欢迎回来，yiyi。我们从哪里继续？ |
| 权限 | 请求审查 / 默认 / 自动 / 极速 |
| 设置面板 | 全中文 |
| 右键菜单、托盘、更新弹窗 | 全中文 |

> 模型名（Gemini 4 Neon High、Claude Opus 5.5 等）保持英文——翻了反而对不上官方文档。

---

## 安装（3 步）

1. **完全退出** Antigravity（包括右下角托盘图标）
2. 双击 **`一键汉化.bat`**
3. 等窗口跑完，客户端会自动重新打开，界面就是中文了

> 第一次运行 Windows 可能提示 SmartScreen，选「更多信息 → 仍要运行」。

---

## 还原英文

双击 **`一键还原英文.bat`**，跑完自动回到官方英文版。

---

## 客户端更新后变回英文怎么办

Antigravity 每次自动更新都会用官方 `app.asar` 覆盖掉汉化，这是正常的。

**更新完再双击一次 `一键汉化.bat` 即可**，30 秒。

---

## 常见问题

**Q：提示「Antigravity not found」**
脚本会依次找 `%LOCALAPPDATA%\Programs\antigravity`、`Programs\Antigravity`、`Program Files\Antigravity`，再查注册表卸载项。都找不到说明客户端装在非常规位置，把本文件夹放进客户端安装目录旁边再跑一次。

**Q：装完打不开 / 白屏**
双击 `一键还原英文.bat` 回到原版，然后把版本号发我（帮助 → 关于），不同大版本需要对应补丁。

**Q：会不会封号 / 影响登录**
不会。补丁只替换界面字符串，不碰网络请求、不碰 OAuth、不碰遥测开关。

**Q：能汉化 macOS 吗**
上游引擎带 macOS 分支，但本项目只在 Windows 上验证过。

---

## 目录结构

~~~
一键汉化.bat            安装入口
一键还原英文.bat        还原入口
localization_engine.js  汉化主引擎（探测路径 / 备份 / 重打包 asar / 清缓存 / 重启）
src/asar_patcher.js     asar 读写
src/main_patches.js     主进程补丁（preload/menu/tray/updater/弹窗）
src/preload_runtime.js  前端 DOM 翻译引擎
dicts/                  简体词典
dicts_tw/               繁體词典
~~~

---

## 致谢与许可

- 汉化引擎来自 [qqxpee/antigravity2-cn](https://github.com/qqxpee/antigravity2-cn)（MIT），本项目在其基础上：
  - 加了 **零依赖启动**（用 Antigravity 自带 Electron 运行引擎，不需要 Node.js）
  - 加了 **安装目录自动探测**（含注册表回退）
  - 补了 10 条词典（Leaving Soon / Coming soon / Experimental / Token 等）
  - 重写了面向普通用户的中文文档
- 本项目同样以 **MIT** 协议开源，见 [LICENSE](LICENSE)。

**与 Google 无关**，非官方项目；汉化仅修改本地界面字符串。
