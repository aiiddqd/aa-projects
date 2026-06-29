# CHANGELOG

## 20260629 — правки по ROADMAP

- Заменена картинка в hero на фото «White suv advertisement on a large building facade» (QsI4maNVDQk) — прямой URL Unsplash CDN.
- Секция «Процесс»: заголовок «Дорожная карта» оставлен (правильно).
- Секция «Контакты»: заголовок уже соответствует требованию «Сразу к диалогу» — оставлено как есть.
- Сетка секции «Процесс» изменена с 5 колонок на 3 — карточки шире, 3 в первом ряду и 2 во втором; декоративная линия-рейл убрана.
- Заменены 6 битых Unsplash-изображений в секциях «Услуги» и «Кейсы» на рабочие (проверены через naturalWidth в браузере): промышленное брендирование, арт-навигация, 3D-превизуализация, сопровождение площадок, резервуарный парк, контейнерный терминал.
- В ROADMAP отмечены выполненные пункты.

## 20260629

- Реализована миграция на Ferrari Design System (Option A — перенастройка daisyUI-темы `adsart`).
- daisyUI-тема `adsart` перенастроена: near-black canvas (#181818), Rosso Corsa primary (#da291c), sharp 0px corners (`--radius-box/field/selector: 0rem`), `prefersdark: true`.
- В `:root` добавлены Ferrari CSS custom properties: цвета (`--canvas`, `--rosso-corsa`, `--ink`, `--body`, `--hairline` …), spacing-лестница (`--space-xxxs` … `--space-super`), radius (`--radius-none` … `--radius-full`), единственный shadow tier `--shadow-soft`.
- Установлен `@fontsource/inter` (400/500/700) как self-hosted замена FerrariSans; Google Fonts CDN удалён из `Layout.astro`.
- Добавлена типографическая иерархия: `.display-mega` (80→32px), `.display-lg`, `.display-md`, `.title-md`, `.body-md`, `.caption-uppercase` и др.
- Hero переделан в `hero-band-cinema`: full-bleed фотография промышленного объекта, display-mega h1, primary + outline CTA с sharp corners.
- Карточки «Услуги» и «Проекты» мигрированы на `feature-card-photo`: изображение сверху edge-to-edge, текст под ним, 0px corners.
- Между секциями «Услуги» и «Проекты» добавлен `livery-band` — full-width Rosso Corsa акцент.
- Навигация — `top-nav-on-dark` (uppercase + tracking 0.65px); контакты — `cta-band-dark`; футер — `footer-dark`.
- Удалены emoji (🗺️), старые galvanized/zinc токены, `panel-glow`, `object-passport`, `contacts-panel`, `site-main::before` декор.
- `npm run build` проходит без ошибок; dev-сервер рендерит страницу без console errors.
- Создан RFC `260629-ferrari-design-system-adoption` — принятие Ferrari Design System как визуального стандарта проекта.

## 20260628

- В hero-блоке заменен заголовок «Карта текущего объекта» на emoji «📍» для более лаконичной подачи.
- В hero-блоке полностью удалена карточка «паспорта объекта» и заменена на крупный emoji-блок «🗺️».
- В секции «Услуги» удалены повторяющиеся бейджи «Модуль» со всех карточек.
- Исправлена поломанная HTML-структура в секциях «Команда» и «Контакты» (несовпадение открывающих/закрывающих div), ошибка CompilerError устранена.
- В секции «Контакты» усилен контраст: повышена читаемость текстов и заменены outline-кнопки на высококонтрастный вариант с явной рамкой и hover-инверсией.
- Устранено нарушение контраста заголовка и описания в секции «Контакты»: добавлен отдельный высококонтрастный стиль контейнера `contacts-panel`.
- В секции «Контакты» укорочен текст кнопки звонка (без номера), номер вынесен в отдельную строку для стабильной верстки.
- В секции «Команда» иконки в карточках перенесены над текстом роли для устранения поломки верстки.