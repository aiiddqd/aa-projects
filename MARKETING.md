# MARKETING.md

## Что Это За Файл
Базовая маркетинговая конфигурация, которую читают все агенты в начале сессии.
Этот файл является главным источником правил для маркетинговых действий в репозитории.

## 1. Бизнес-Идентичность
```yaml
brand:
  name: "Ads Art Group"
  category: "Специальное и промышленное брендирование с художественным уклоном"
  business_model: "Агентские услуги полного цикла"
  market_focus: ["Россия", "СНГ"]
  positioning_core: "Художественное промышленное брендирование: от контейнера до небоскреба"
  competitor_reference: "https://specbranding.ru"
  status: "mvp_definition"
```

## 2. Голос И Тон
- Уверенный, брутальный, креативный, с уважением к индустриальной эстетике.
- Фокус на конкретике: объект, масштаб, сроки, технология, результат.
- Избегаем абстракций и неподтвержденных сверхобещаний.

### Разрешенный Стиль
- Формулировки с наблюдаемой пользой и измеримым результатом.
- Прозрачные ограничения, этапы и допущения.

### Запрещенный Стиль
- Придуманные цифры, награды, кейсы и отзывы.
- Сравнительные заявления без источника и согласования.

## 3. Персоны Клиентов
- Собственник или CEO промышленных активов: нужен заметный бренд и эффект масштаба.
- Маркетинг-руководитель: нужны кейсы, сроки, предсказуемая реализация.
- Руководитель объекта или эксплуатации: нужны безопасность, технологичность и надежный процесс.

## 4. Типы Кампаний
```yaml
campaign_types:
  portfolio_showcase:
    channels: ["website", "organic_social", "video"]
    primary_kpi: "qualified_inquiries"
  demand_capture:
    channels: ["seo", "search_ads", "retargeting", "landing_pages"]
    primary_kpi: "brief_starts"
  launch_mvp_site:
    channels: ["website", "pr", "social", "messengers"]
    primary_kpi: "meetings_booked"
```

## 5. KPI-Фреймворк
```yaml
kpi_framework:
  north_star: "квалифицированные заявки на запуск брендирования"
  primary_metrics:
    - "qualified_inquiries"
    - "brief_starts"
    - "meetings_booked"
  secondary_metrics:
    - "portfolio_case_views"
    - "before_after_interactions"
    - "landing_cvr"
    - "lead_to_meeting_rate"
anomaly_detection:
  lookback_window_days: 14
  sensitivity: "medium"
```

## 6. Правила Комплаенса И Подавления
```yaml
global_suppression:
  unsubscribes: immediate_permanent
  unknown_contact_permission: treated_as_suppressed
compliance:
  required_baseline:
    - "consent_record"
    - "clear_unsubscribe"
    - "no_deceptive_claims"
  ambiguous_state: "escalate_to_human"
```

## 7. Обязательные Согласования
```yaml
approval_gates:
  required:
    - "запуск новой платной кампании"
    - "увеличение или перераспределение бюджета"
    - "публикация внешних заявлений вне approved_claims"
    - "публичная реакция на кризис"
    - "изменение правил комплаенса и подавления"
  mode: "notify_and_wait"
```

## 8. Запрещенные Действия
- Нельзя отправлять сообщения в подавленные сегменты или контактам без подтвержденного статуса разрешения.
- Нельзя публиковать неподтвержденные показатели эффективности проектов.
- Нельзя запускать или масштабировать платный трафик без явного согласования.
- Нельзя обходить комплаенс-проверку из-за дедлайнов.

## 9. Версионирование
```yaml
marketing_md:
  version: "1.1.0"
  review_cadence: "Quarterly"
  owner_role: "marketing_lead_or_founder"
```

## 10. Автономность И Безопасность AI
```yaml
autonomy_levels:
  full_autonomy:
    - "черновики контента на базе approved_claims"
    - "предложения по структуре страниц и экспериментам"
  notify_and_proceed:
    - "редактура уже согласованных материалов"
    - "регулярные отчеты и срезы"
  notify_and_wait:
    - "отправка кампаний"
    - "запуск paid-активностей"
    - "изменение таргетинга, ставок и бюджета"
    - "публикация новых внешних заявлений"
  human_only:
    - "юридические и комплаенс-интерпретации"
    - "финальное согласование кризисной коммуникации"
    - "обязательные ценовые и договорные обещания"
fallback_defaults:
  unknown_suppression_status: "suppress"
  unknown_budget_status: "pause_and_alert"
  missing_channel_rule: "do_not_execute"
  ambiguous_compliance_state: "escalate_to_human"
```

## 11. Реестр Companion-Файлов
```yaml
companion_registry:
  always_load:
    - "companion/SAFETY.MD"
  role_based:
    content:
      - "companion/MESSAGING.MD"
    campaign_paid:
      - "companion/MESSAGING.MD"
    analytics:
      - "companion/MESSAGING.MD"
```

## 12. Контентный Каркас MVP Сайта
```yaml
website_mvp:
  key_pages:
    - "Главная"
    - "О нас / Специальное брендирование"
    - "Услуги"
    - "Проекты / Портфолио"
    - "Процесс работы"
    - "Команда"
    - "Контакты + Калькулятор"
  key_features:
    - "до/после слайдеры"
    - "видео и дрон-съемка"
    - "фильтры кейсов по типу, году, индустрии"
    - "seo-посадочные под промышленное брендирование"
```

## 13. Источники Контекста
- Основной контекст взят из RFC [rfc/260628-mvp.md](rfc/260628-mvp.md).
