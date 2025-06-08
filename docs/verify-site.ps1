# ATM Banking System - 網站驗證腳本
# PowerShell 版本

Write-Host "🔍 開始驗證 GitHub Pages 網站..." -ForegroundColor Cyan
Write-Host ""

# 檢查必要檔案
Write-Host "📁 檢查檔案結構..." -ForegroundColor Yellow

$requiredFiles = @(
    "index.html",
    "getting-started.html", 
    "user-guide.html",
    "api-reference.html",
    "architecture.html",
    "_config.yml",
    "sitemap.xml",
    "favicon.ico",
    ".nojekyll",
    "README.md",
    "assets\css\style.css",
    "assets\js\main.js",
    "assets\images\favicon.svg",
    "assets\images\og-image.svg",
    "assets\meta-tags.html"
)

$missingFiles = @()

foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file" -ForegroundColor Green
    } else {
        Write-Host "❌ $file" -ForegroundColor Red
        $missingFiles += $file
    }
}

# 檢查 HTML 檔案的 meta 標籤
Write-Host ""
Write-Host "🏷️  檢查 Meta 標籤..." -ForegroundColor Yellow

$htmlFiles = @("index.html", "getting-started.html", "user-guide.html", "api-reference.html", "architecture.html")

foreach ($file in $htmlFiles) {
    if (Test-Path $file) {
        Write-Host "檢查 $file..." -ForegroundColor White
        
        # 檢查基本 meta 標籤
        $content = Get-Content $file -Raw
        if ($content -match "<title>" -and $content -match 'meta name="description"') {
            Write-Host "  ✅ 基本 meta 標籤正常" -ForegroundColor Green
        } else {
            Write-Host "  ❌ 缺少基本 meta 標籤" -ForegroundColor Red
        }
        
        # 檢查 Open Graph 標籤
        if ($content -match 'property="og:title"' -and $content -match 'property="og:description"') {
            Write-Host "  ✅ Open Graph 標籤正常" -ForegroundColor Green
        } else {
            Write-Host "  ❌ 缺少 Open Graph 標籤" -ForegroundColor Red
        }
        
        # 檢查 favicon
        if ($content -match 'rel="icon"') {
            Write-Host "  ✅ Favicon 連結正常" -ForegroundColor Green
        } else {
            Write-Host "  ❌ 缺少 Favicon 連結" -ForegroundColor Red
        }
    }
}

# 檢查 CSS 檔案
Write-Host ""
Write-Host "🎨 檢查 CSS 檔案..." -ForegroundColor Yellow
if (Test-Path "assets\css\style.css") {
    $cssLines = (Get-Content "assets\css\style.css").Count
    Write-Host "✅ style.css 存在 ($cssLines 行)" -ForegroundColor Green
    
    # 檢查重要的 CSS 類別
    $cssClasses = @(".navbar", ".hero", ".docs-layout", ".api-table", ".class-diagram")
    $cssContent = Get-Content "assets\css\style.css" -Raw
    
    foreach ($class in $cssClasses) {
        if ($cssContent -match [regex]::Escape($class)) {
            Write-Host "  ✅ CSS 類別 $class 存在" -ForegroundColor Green
        } else {
            Write-Host "  ❌ CSS 類別 $class 缺失" -ForegroundColor Red
        }
    }
} else {
    Write-Host "❌ CSS 檔案不存在" -ForegroundColor Red
}

# 檢查 JavaScript 檔案
Write-Host ""
Write-Host "📜 檢查 JavaScript 檔案..." -ForegroundColor Yellow
if (Test-Path "assets\js\main.js") {
    $jsLines = (Get-Content "assets\js\main.js").Count
    Write-Host "✅ main.js 存在 ($jsLines 行)" -ForegroundColor Green
} else {
    Write-Host "❌ JavaScript 檔案不存在" -ForegroundColor Red
}

# 檢查 _config.yml 配置
Write-Host ""
Write-Host "⚙️  檢查 Jekyll 配置..." -ForegroundColor Yellow
if (Test-Path "_config.yml") {
    Write-Host "✅ _config.yml 存在" -ForegroundColor Green
    
    # 檢查重要配置項目
    $configItems = @("title:", "description:", "baseurl:", "url:")
    $configContent = Get-Content "_config.yml" -Raw
    
    foreach ($item in $configItems) {
        if ($configContent -match [regex]::Escape($item)) {
            Write-Host "  ✅ 配置項目 $item 存在" -ForegroundColor Green
        } else {
            Write-Host "  ❌ 配置項目 $item 缺失" -ForegroundColor Red
        }
    }
} else {
    Write-Host "❌ Jekyll 配置檔案不存在" -ForegroundColor Red
}

# 總結
Write-Host ""
Write-Host "📊 驗證總結:" -ForegroundColor Cyan
if ($missingFiles.Count -eq 0) {
    Write-Host "🎉 所有檔案都存在！網站準備好部署到 GitHub Pages。" -ForegroundColor Green
} else {
    Write-Host "⚠️  缺少 $($missingFiles.Count) 個檔案：" -ForegroundColor Yellow
    foreach ($file in $missingFiles) {
        Write-Host "   - $file" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "🚀 下一步：" -ForegroundColor Cyan
Write-Host "1. 更新 _config.yml 中的 GitHub 用戶名和 repository 名稱" -ForegroundColor White
Write-Host "2. 推送到 GitHub repository" -ForegroundColor White
Write-Host "3. 在 GitHub Settings > Pages 中啟用 GitHub Pages" -ForegroundColor White
Write-Host "4. 選擇 'Deploy from a branch' 並選擇 'main' 分支的 '/docs' 目錄" -ForegroundColor White

Write-Host ""
Write-Host "完成！ 🎯" -ForegroundColor Green
