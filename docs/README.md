# 🏧 ATM Banking System - GitHub Pages 部署指南

這是一個完整的 ATM 銀行系統模擬器，使用 C++ 開發，並配備了專業的 GitHub Pages 文檔網站。

## 📋 專案概述

ATM Banking System 是一個功能完整的銀行自動櫃員機模擬系統，包含：

- 💳 用戶帳戶管理
- 💰 存款、提款、轉帳功能
- 📊 交易記錄查詢
- 🔐 安全驗證機制
- 👨‍💼 管理員功能
- 📈 系統統計與報告

## 🚀 GitHub Pages 部署步驟

### 步驟 1：準備 Repository

1. 將專案推送到 GitHub Repository
2. 確保 `docs` 目錄包含所有網站檔案

### 步驟 2：啟用 GitHub Pages

1. 進入你的 GitHub Repository
2. 點擊 **Settings** 標籤
3. 滾動到 **Pages** 部分
4. 在 **Source** 下拉選單中選擇 **Deploy from a branch**
5. 在 **Branch** 下拉選單中選擇 **main** (或 **master**)
6. 在 **Folder** 下拉選單中選擇 **/docs**
7. 點擊 **Save**

### 步驟 3：更新配置

編輯 `docs/_config.yml` 檔案，更新以下資訊：

```yaml
# 更新為你的實際資訊
baseurl: "/ATM_Banking_System" # 你的 repository 名稱
url: "https://your-username.github.io" # 你的 GitHub Pages URL

# 更新作者資訊
author:
  name: 你的名字
  email: your-email@example.com

# 更新社交連結
social:
  links:
    - https://github.com/your-username/ATM_Banking_System
```

### 步驟 4：等待部署

- GitHub Pages 通常需要幾分鐘來建置網站
- 你可以在 Repository 的 **Actions** 標籤中查看建置進度
- 建置完成後，你的網站將在 `https://your-username.github.io/ATM_Banking_System` 可用

## 📁 網站結構

```
docs/
├── index.html              # 主頁面
├── getting-started.html    # 快速開始指南
├── user-guide.html         # 使用者指南
├── api-reference.html      # API 參考文檔
├── architecture.html       # 系統架構設計
├── _config.yml            # Jekyll 配置
├── sitemap.xml            # 網站地圖
├── favicon.ico            # 網站圖標
└── assets/
    ├── css/
    │   └── style.css      # 樣式檔案
    ├── js/
    │   └── main.js        # JavaScript 功能
    ├── images/
    │   ├── favicon.svg    # SVG 圖標
    │   └── og-image.svg   # 社交分享圖片
    └── meta-tags.html     # SEO meta 標籤
```

## 🛠️ 自定義網站

### 更新內容

- 編輯 HTML 檔案來更新頁面內容
- 修改 `assets/css/style.css` 來自定義樣式
- 更新 `assets/js/main.js` 來添加互動功能

### 添加新頁面

1. 在 `docs` 目錄中創建新的 HTML 檔案
2. 使用現有頁面作為模板
3. 在其他頁面的導航中添加連結

### SEO 優化

- 更新每個頁面的 `<title>` 和 `<meta>` 標籤
- 使用 `assets/meta-tags.html` 作為參考
- 確保 `sitemap.xml` 包含所有頁面

## 🎨 網站功能

### 響應式設計
- 支援桌面、平板、手機等各種裝置
- 使用 CSS Grid 和 Flexbox 佈局

### 現代化 UI
- 漸層背景和動畫效果
- 卡片式設計風格
- 專業的色彩配色

### 互動功能
- 平滑滾動效果
- 回到頂部按鈕
- 導航高亮顯示

### SEO 友好
- 結構化 HTML
- Meta 標籤優化
- 網站地圖支援

## 🔧 技術棧

- **前端**: HTML5, CSS3, JavaScript (ES6+)
- **樣式**: CSS Grid, Flexbox, CSS 變數
- **圖標**: SVG 自定義圖標
- **部署**: GitHub Pages + Jekyll
- **SEO**: Open Graph, Twitter Cards

## 📞 支援

如果你在部署過程中遇到問題：

1. 檢查 GitHub Repository 的 **Actions** 標籤查看錯誤
2. 確認 `docs/_config.yml` 配置正確
3. 驗證所有檔案路徑都是正確的
4. 查看 [GitHub Pages 文檔](https://docs.github.com/en/pages) 獲取更多幫助

## 📄 授權

本專案採用 MIT 授權條款 - 詳見 [LICENSE](LICENSE) 檔案。

---

**🎉 現在你的 ATM Banking System 已經準備好在 GitHub Pages 上發布了！**
