## RFC: Adoption of Ferrari Design System as Visual Standard

### Introduction

Проект `aa-projects/astro` (MVP сайта Ads Art Group) сейчас использует кастомную daisyUI-тему `adsart` с «galvanized/zinc» палитрой и скруглёнными карточками. В репозитории уже присутствует `DESIGN.md`, описывающий дизайн-систему Ferrari (cinematic editorial, Rosso Corsa, near-black canvas, FerrariSans, sharp 0px corners). Настоящий RFC фиксирует решение принять Ferrari DS как единый визуальный стандарт проекта и описывает миграцию текущего MVP на эту систему.

Use [DESIGN.md](./DESIGN.md) for reference and guidance.

### Goals & Motivation

- **Единый источник истины.** Сейчас визуальные токены размазаны между `global.css` (CSS-переменные `--galvanized-light`, `--zinc-plate`, `--asphalt-ink`, `--safety-orange`, `--cobalt-mark`, `--survey-lime`) и daisyUI-темой `adsart`. `DESIGN.md` уже есть, но не применяется на практике.
- **Кинематографичная подача бренда.** Ads Art Group — промышленный арт-брендинг; визуал должен читать как «editorial / cinematic», а не как стандартный SaaS-шаблон. Ferrari DS даёт именно этот язык: near-black canvas, один акцент, full-bleed hero, sharp corners.
- **Снижение визуального шума.** Текущая палитра содержит 5+ насыщенных цветов (`--safety-orange`, `--cobalt-mark`, `--survey-lime`, secondary, accent). Ferrari DS требует один brand voltage (Rosso Corsa) и near-black canvas — это убирает «радужность».
- **Почему сейчас.** MVP уже работает, но перед добавлением новых секций (кейсы, процесс, контакты) нужно зафиксировать визуальный стандарт, чтобы не плодить ad-hoc стили.

### Components & Design

#### Use Cases

- **Посетитель сайта:** открывает главную, видит full-bleed hero с промышленным объектом, один Rosso Corsa CTA «Обсудить проект», читает секции на near-black canvas с hairline-разделителями.
- **Заказчик:** скроллит кейсы в виде photo-first карточек с sharp 0px corners, видит «livery band» — full-width Rosso Corsa акцент между секциями.
- **Мобильный пользователь:** hero h1 масштабируется 80→32px, сетка карточек коллапсирует 3-up → 1-up, навигация — hamburger.

#### Functional Requirements

- FR-1. Цветовая палитра: canvas `#181818`, canvas-elevated `#303030`, canvas-light `#ffffff`, primary (Rosso Corsa) `#da291c`, primary-active `#b01e0a`, ink `#ffffff`, body `#969696`, muted `#666666`, hairline `#303030`, hairline-on-light `#d2d2d2`.
- FR-2. Типографика: единый sans (Inter 500 как open-source замена FerrariSans), display weight 500, CTA uppercase + 1.4px tracking, nav uppercase + 0.65px tracking, negative letter-spacing на display (-0.36px … -1.6px).
- FR-3. Скругления: `{rounded.none}` (0px) на всех CTA, карточках, бандах; `{rounded.full}` (9999px) только на badge-pill; `{rounded.sm}` (4px) на form inputs.
- FR-4. Spacing: 8px-лестница `xxxs` 4 / `xxs` 8 / `xs` 16 / `sm` 24 / `md` 32 / `lg` 48 / `xl` 64 / `xxl` 96 / `super` 128; секции — `xxl` (96px), hero — `super` (128px).
- FR-5. Elevation: photographic depth + brightness-step; единственный shadow tier `0 4px 8px rgba(0,0,0,0.1)` на hover-карточках; никаких многоуровневых drop shadows.
- FR-6. Компоненты: `hero-band-cinema`, `feature-card-photo`, `livery-band`, `spec-cell`, `button-primary` (Rosso Corsa, 0px, uppercase), `button-outline-on-dark`, `badge-pill`, `top-nav-on-dark`, `footer-dark`.
- FR-7. Hero: full-bleed фотография промышленного объекта, display-mega h1 (80px / 500 / -1.6px), один primary CTA + один outline CTA.
- FR-8. Livery band: full-width Rosso Corsa акцент-секция между dark editorial bands, display-lg заголовок, 96px padding.

#### Non-Functional Requirements

- **Производительность:** Inter подключается через `@fontsource/inter` (self-hosted, woff2), не через Google Fonts CDN — чтобы не добавлять third-party запрос.
- **Доступность:** контраст текста на near-black canvas — ink `#ffffff` на `#181818` (ratio ~16:1, WCAG AAA); body `#969696` на `#181818` (ratio ~7:1, WCAG AAA); Rosso Corsa CTA с белым текстом — ratio ~4.6:1 (WCAG AA для крупного текста).
- **Масштабируемость:** токены выносятся в CSS custom properties в `:root`, daisyUI-тема `adsart` перенастраивается на Ferrari-палитру (или заменяется на vanilla CSS + Tailwind utilities).
- **Совместимость:** Astro static output, без JS-фреймворков; сохраняется текущий `data-track` analytics-слой.

#### Technical & Architecture Details

- **Шрифт:** `@fontsource/inter` (weight 400, 500, 700) как замена FerrariSans; fallback `-apple-system, system-ui, sans-serif`.
- **Tailwind / daisyUI:** daisyUI-тема `adsart` перенастраивается — `--color-base-100: #181818`, `--color-base-content: #ffffff`, `--color-primary: #da291c`, `--color-primary-content: #ffffff`, `--color-secondary: #303030`, `--color-accent: #da291c`, `--radius-box: 0rem`. Альтернатива: убрать daisyUI и использовать чистый Tailwind + кастомные компонентные классы.
- **CSS custom properties:** в `:root` добавляются Ferrari-токены (`--canvas`, `--canvas-elevated`, `--canvas-light`, `--rosso-corsa`, `--rosso-corsa-active`, `--ink`, `--body`, `--muted`, `--hairline`, `--hairline-on-light`, spacing ladder `--space-xxxs` … `--space-super`, radius `--radius-none`, `--radius-sm`, `--radius-full`).
- **Иконки:** текущий `Icon.astro` (inline SVG) сохраняется; stroke-width приводится к 1.5–1.9 для соответствия editorial-стилю.
- **Hero photography:** `hero-band-cinema` использует full-bleed `<img>` / `<picture>` с `object-fit: cover`; на мобильных — art direction через `<source media>`.

### Acceptance Criteria

- **AC-1.** Все цвета в `global.css` и `index.astro` используют Ferrari-токены (CSS custom properties), не хардкод hex. Проверка: `rg "#[0-9a-fA-F]{3,6}" astro/src` возвращает 0 вхождений вне `:root` и `DESIGN.md`.
- **AC-2.** Все CTA (`btn-primary`, `btn-outline`) имеют `border-radius: 0` и uppercase-текст с tracking 1.4px. Визуальная проверка в браузере.
- **AC-3.** Hero-секция использует full-bleed фотографию (не сплошной фон), h1 в display-mega (80px desktop / 32px mobile).
- **AC-4.** Между секциями «Услуги» и «Проекты» (или аналогичными) добавлен `livery-band` — full-width Rosso Corsa акцент.
- **AC-5.** Карточки «Услуги» и «Проекты» — photo-first (`feature-card-photo`): изображение сверху edge-to-edge, текст под ним, sharp 0px corners.
- **AC-6.** Контраст текста соответствует WCAG AA: ink на canvas ≥ 4.5:1, body на canvas ≥ 4.5:1. Проверка через Lighthouse или axe DevTools.
- **AC-7.** Spacing использует 8px-лестницу: секции 96px, карточки 32px, gaps 16/24px. Проверка через инспекцию computed styles.
- **AC-8.** `npm run build` проходит без ошибок; `npm run dev` рендерит страницу без console errors.
- **AC-9.** `DESIGN.md` остаётся источником истины; любые отклонения задокументированы в «Known Gaps».
- **AC-10.** Мобильная вёрстка: hero h1 32px, сетка 1-up, hamburger-навигация ниже 768px.

### Roadmap

1. **Фаза 1 — Токены (1-2 ч).** Добавить Ferrari CSS custom properties в `:root` в `global.css`; перенастроить daisyUI-тему `adsart` или заменить на vanilla Tailwind.
2. **Фаза 2 — Типографика (1 ч).** Установить `@fontsource/inter`; подключить веса 400/500/700; настроить типографическую иерархию (display-mega, display-lg, body-md, button, nav-link).
3. **Фаза 3 — Hero (2 ч).** Переделать hero-секцию в `hero-band-cinema`: full-bleed фото, display-mega h1, primary + outline CTA с sharp corners.
4. **Фаза 4 — Компоненты (3-4 ч).** Мигрировать карточки «Услуги»/«Проекты» на `feature-card-photo`; добавить `livery-band` между секциями; переработать `top-nav` и `footer` под `top-nav-on-dark` / `footer-dark`.
5. **Фаза 5 — Контакты (1 ч).** Привести секцию «Контакты» к `cta-band-dark`: centered display-lg заголовок, один Rosso Corsa CTA, 96px padding.
6. **Фаза 6 — QA (1 ч).** Lighthouse accessibility audit, кросс-браузерная проверка, мобильная вёрстка, `npm run build`.

### Optional Sections

#### Open Questions

- **OQ-1.** Использовать `@fontsource/inter` (self-hosted) или подключить Inter через Google Fonts? Self-hosted предпочтительнее для privacy/performance, но добавляет ~60KB к bundle.
- **OQ-2.** Сохранять daisyUI как слой или уйти на чистый Tailwind + кастомные классы? daisyUI даёт готовые компоненты (btn, card, badge), но его дефолтные радиусы и тени конфликтуют с Ferrari DS.
- **OQ-3.** Где брать hero-фотографию промышленного объекта? Нужен stock или съёмка; на время MVP — placeholder из Unsplash (резервуарный парк, контейнерный терминал).
- **OQ-4.** Сохранять ли текущие emoji (🗺️ в hero) или заменять на фотографии? Ferrari DS не использует emoji — это противоречит cinematic-стилю.

#### Alternatives

### Solution Options

#### Option A: Перенастройка daisyUI-темы `adsart`

**Pros:**

- Минимальные изменения в разметке: `btn`, `card`, `badge` классы остаются.
- daisyUI даёт готовые компоненты, меньше ручного CSS.
- Быстрая миграция (1-2 дня).

**Cons:**

- daisyUI-дефолты (rounded, shadows) конфликтуют с Ferrari DS — нужны `!important` overrides.
- Ограничивает контроль над точной геометрией компонентов.
- Тема `adsart` уже содержит «лишние» цвета (secondary, accent), которые не нужны в Ferrari-палитре.

**Trade-offs:**

- Скорость миграции vs. чистота системы.

#### Option B: Чистый Tailwind + кастомные компонентные классы

**Pros:**

- Полный контроль над каждым пикселем; нет борьбы с daisyUI-дефолтами.
- CSS custom properties напрямую маппятся на Ferrari-токены.
- Меньше CSS-бандл (убираем daisyUI plugin).

**Cons:**

- Нужно переписать все `btn`, `card`, `badge` классы на кастомные.
- Больше ручной работы (3-4 дня).
- Потеря готовых daisyUI-компонентов (menu, navbar, form-control).

**Trade-offs:**

- Чистота и контроль vs. трудозатраты.

### Recommendation

**Option A (перенастройка daisyUI-темы)** — рекомендуемый путь для текущей итерации.

Обоснование:
- MVP уже работает на daisyUI; полная замена на Option B — риск регрессий.
- daisyUI-тема `adsart` перенастраивается через `@plugin "daisyui/theme"` блок: меняются `--color-base-100`, `--color-primary`, `--radius-box` и т.д.
- `!important` overrides для sharp corners и uppercase CTAs добавляются точечно в `global.css`.
- В следующей итерации (после стабилизации) можно перейти на Option B, если daisyUI-ограничения станут блокирующими.
