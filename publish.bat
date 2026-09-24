@echo off
REM ============================================================
REM  项目需求看板 -> GitHub Pages 一键发布脚本 (Windows)
REM  用法：在本文件夹（ghpages）里双击本文件，或在 Git Bash 运行
REM  前提：本机已装 Git，且对 github.com/Viola1203/Projects 有写权限
REM        （首次推送会要求输入 用户名 + Personal Access Token）
REM ============================================================
cd /d %~dp0

git init -q
git checkout -b gh-pages 2>nul || git checkout -q gh-pages
git add -A
git commit -q -m "deploy kanban v3.99" || echo （如无改动则跳过提交）
git remote remove origin 2>nul
git remote add origin https://github.com/Viola1203/Projects.git
git push -f origin gh-pages

echo.
echo ============================================================
echo  推送完成！
echo  1) 打开 https://github.com/Viola1203/Projects/settings/pages
echo  2) Source 选择 "Deploy from a branch" -> 分支选 "gh-pages" / 目录选 "(root)" -> Save
echo  3) 等待 1~2 分钟，访问： https://Viola1203.github.io/Projects/
echo ============================================================
pause
