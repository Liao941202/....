#!/bin/bash

# ATM Banking System GitHub Pages 驗證腳本
# 檢查所有重要檔案是否存在以及連結是否正確

echo "🔍 開始驗證 GitHub Pages 網站..."

# 檢查必要檔案
echo "📁 檢查檔案結構..."

files=(
    "docs/index.html"
    "docs/getting-started.html"
    "docs/user-guide.html"
    "docs/api-reference.html"
    "docs/architecture.html"
    "docs/_config.yml"
    "docs/sitemap.xml"
    "docs/favicon.ico"
    "docs/.nojekyll"
    "docs/README.md"
    "docs/assets/css/style.css"
    "docs/assets/js/main.js"
    "docs/assets/images/favicon.svg"
    "docs/assets/images/og-image.svg"
    "docs/assets/meta-tags.html"
)

missing_files=()

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file"
        missing_files+=("$file")
    fi
done

# 檢查 HTML 檔案的 meta 標籤
echo -e "\n🏷️  檢查 Meta 標籤..."

html_files=(
    "docs/index.html"
    "docs/getting-started.html"
    "docs/user-guide.html"
    "docs/api-reference.html"
    "docs/architecture.html"
)

for file in "${html_files[@]}"; do
    if [ -f "$file" ]; then
        echo "檢查 $file..."
        
        # 檢查基本 meta 標籤
        if grep -q "<title>" "$file" && grep -q 'meta name="description"' "$file"; then
            echo "  ✅ 基本 meta 標籤正常"
        else
            echo "  ❌ 缺少基本 meta 標籤"
        fi
        
        # 檢查 Open Graph 標籤
        if grep -q 'property="og:title"' "$file" && grep -q 'property="og:description"' "$file"; then
            echo "  ✅ Open Graph 標籤正常"
        else
            echo "  ❌ 缺少 Open Graph 標籤"
        fi
        
        # 檢查 favicon
        if grep -q 'rel="icon"' "$file"; then
            echo "  ✅ Favicon 連結正常"
        else
            echo "  ❌ 缺少 Favicon 連結"
        fi
    fi
done

# 檢查 CSS 檔案
echo -e "\n🎨 檢查 CSS 檔案..."
if [ -f "docs/assets/css/style.css" ]; then
    css_size=$(wc -l < "docs/assets/css/style.css")
    echo "✅ style.css 存在 ($css_size 行)"
    
    # 檢查重要的 CSS 類別
    css_classes=(".navbar" ".hero" ".docs-layout" ".api-table" ".class-diagram")
    for class in "${css_classes[@]}"; do
        if grep -q "$class" "docs/assets/css/style.css"; then
            echo "  ✅ CSS 類別 $class 存在"
        else
            echo "  ❌ CSS 類別 $class 缺失"
        fi
    done
else
    echo "❌ CSS 檔案不存在"
fi

# 檢查 JavaScript 檔案
echo -e "\n📜 檢查 JavaScript 檔案..."
if [ -f "docs/assets/js/main.js" ]; then
    js_size=$(wc -l < "docs/assets/js/main.js")
    echo "✅ main.js 存在 ($js_size 行)"
else
    echo "❌ JavaScript 檔案不存在"
fi

# 檢查 _config.yml 配置
echo -e "\n⚙️  檢查 Jekyll 配置..."
if [ -f "docs/_config.yml" ]; then
    echo "✅ _config.yml 存在"
    
    # 檢查重要配置項目
    config_items=("title:" "description:" "baseurl:" "url:")
    for item in "${config_items[@]}"; do
        if grep -q "$item" "docs/_config.yml"; then
            echo "  ✅ 配置項目 $item 存在"
        else
            echo "  ❌ 配置項目 $item 缺失"
        fi
    done
else
    echo "❌ Jekyll 配置檔案不存在"
fi

# 總結
echo -e "\n📊 驗證總結:"
if [ ${#missing_files[@]} -eq 0 ]; then
    echo "🎉 所有檔案都存在！網站準備好部署到 GitHub Pages。"
else
    echo "⚠️  缺少 ${#missing_files[@]} 個檔案："
    for file in "${missing_files[@]}"; do
        echo "   - $file"
    done
fi

echo -e "\n🚀 下一步："
echo "1. 更新 docs/_config.yml 中的 GitHub 用戶名和 repository 名稱"
echo "2. 推送到 GitHub repository"
echo "3. 在 GitHub Settings > Pages 中啟用 GitHub Pages"
echo "4. 選擇 'Deploy from a branch' 並選擇 'main' 分支的 '/docs' 目錄"

echo -e "\n完成！ 🎯"
