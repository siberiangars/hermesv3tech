# Hermes V3Tech

Рабочее пространство Hermes Agent. Синхронизация между ПК и сервером в Германии.

## Сервер (v3tech — 178.105.255.47)
- **Hermes:** v0.15.1 | **Модель:** deepseek/deepseek-v4-flash (OpenRouter)
- **Шлюз:** Telegram (systemd, linger — живёт после выхода)
- **Авто-бэкап:** каждые 6 часов коммитит config.yaml
- **Работает:** alina-bot (клиент) + Hermes

## Локальный ПК
- Репо: `C:\Users\siber\hermes-sync\`
- Синхронизация: запустить `sync.bat` (двойной клик)

## Структура
```
hermes-sync/
├── README.md         ← этот файл
├── config.yaml       ← конфиг Hermes с сервера
├── sync.bat          ← синхронизация в один клик
└── skills.txt        ← список установленных скиллов
```
