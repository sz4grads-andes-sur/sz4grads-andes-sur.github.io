# SZ4Grads Andes Sur

Sitio web de **SZ4Grads Andes Sur**, grupo hermano de [SZ4Grads](https://www.sz4d.org/sz4grads): una red de jóvenes geocientistas de Latinoamérica interesados en estudiar la zona de subducción andina.

🌐 **https://sz4grads-andes-sur.github.io/**

Sitio estático con [Hugo](https://gohugo.io/) y [Hugo Blox Kit](https://github.com/HugoBlox/kit) (plantilla Academic CV, licencia MIT), publicado en GitHub Pages con GitHub Actions.

## Desarrollo local

Requisitos: Hugo **extended** ≥ 0.161.1 (el despliegue usa la versión fijada en `hugoblox.yaml`), Go, Node y pnpm.

```bash
pnpm install
hugo server --disableFastRender   # http://localhost:1313
```

La primera vez Hugo descarga los módulos del tema y puede tardar unos minutos.

## Dónde editar

| Qué | Archivo |
|---|---|
| Nombre, tema, header y footer | `config/_default/params.yaml` |
| Menú de navegación | `config/_default/menus.yaml` |
| Secciones de la home | `content/_index.md` |
| Bio, redes y correo de la red | `data/authors/me.yaml` |
| Comité Ejecutivo | `content/acerca/_index.md` + `data/authors/<slug>.yaml` |
| Charlas por año | `content/charlas/_index.md` + `content/events/<slug>/` |
| Logo y favicon | `assets/media/logo.png`, `assets/media/icon.png` |
| Fotos de personas | `assets/media/authors/<slug>.webp` |

## Agregar contenido

**Una charla nueva:** copia una carpeta de `content/events/`, cambia el título, la fecha, el ID del video de YouTube y las etiquetas. La etiqueta con el año (`"2026"`) la ubica en su sección de `/charlas/`. Cuando exista la primera charla de 2026, añade en `content/charlas/_index.md` un bloque `collection` como los de 2025 y 2024, con `tags: ['2026']`, y quita el bloque "Próximamente".

**Una persona del comité:** crea `data/authors/<slug>.yaml` con `user_groups: [Comité Ejecutivo]` y su foto en `assets/media/authors/<slug>.webp` (cuadrada, ~800 px).

**Una publicación de Instagram como post del blog:**

```bash
./nuevo-post.sh https://www.instagram.com/p/XXXXXXX/ "Título" 2026-09-15
```

La sección Noticias de la home muestra automáticamente el feed de `@sz4grads_andessur`.

## Despliegue

Cada `git push` a `main` ejecuta `.github/workflows/deploy.yml`, que compila el sitio y lo publica en GitHub Pages (tarda unos 2–3 minutos). En Settings → Pages la fuente debe ser **GitHub Actions**.

## Créditos y licencia

Construido con [Hugo Blox Kit](https://github.com/HugoBlox/kit) © Lore Labs, bajo licencia MIT (ver `LICENSE.md`).
