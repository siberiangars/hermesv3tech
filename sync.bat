@echo off
chcp 65001 > nul
echo ============================================
echo    Hermes Sync — комп ↔ сервер
echo ============================================
echo.

cd /d "%~dp0"

echo [1/3] Забираю изменения с сервера (git pull)...
git pull origin main
echo.

echo [2/3] Отправляю локальные изменения (git push)...
git push origin main
echo.

echo [3/3] Копирую конфиг в локальный Hermes...
if exist "D:\PROJECTS\HERMESSS\.hermes\" (
    copy /Y config.yaml "D:\PROJECTS\HERMESSS\.hermes\config.yaml"
    echo ✓ Конфиг обновлён
)

echo.
echo ============================================
echo    ✓ Синхронизация завершена
echo ============================================
echo    Репо: %CD%
echo    Файлы: README.md, config.yaml
echo.
pause