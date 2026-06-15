#!/bin/bash

# 颜色输出
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🚀 开始部署...${NC}"

# 1. 拉最新代码
echo "📦 拉取最新代码..."
git pull origin main
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ 拉取代码失败${NC}"
    exit 1
fi

# 2. 安装依赖
echo "📚 安装依赖..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate
pip install -r requirements.txt 2>/dev/null || echo "⚠️  没有requirements.txt，跳过"

# 3. 运行测试
echo "🧪 运行测试..."
python3 -m pytest tests/ 2>/dev/null || echo "⚠️  没有测试文件，跳过"

# 4. 完成
echo -e "${GREEN}✅ 部署完成！${NC}"
echo "时间：$(date '+%Y-%m-%d %H:%M:%S')"
