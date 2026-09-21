#!/usr/bin/env bash
# Uso: ./nuevo-post.sh <url-instagram> "Título" [YYYY-MM-DD]
set -euo pipefail
url=${1:-}; title=${2:-}; date=${3:-$(date +%F)}
[[ $url =~ ^https://(www\.)?instagram\.com/(p|reel|tv)/[A-Za-z0-9_-]+ ]] || { echo "URL de Instagram inválida (https://www.instagram.com/p/XXXX/)"; exit 1; }
[[ -n $title ]] || { echo "Falta el título"; exit 1; }
[[ $date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || { echo "Fecha inválida (YYYY-MM-DD)"; exit 1; }
link=$(sed -E 's#^https://(www\.)?instagram\.com/(p|reel|tv)/([A-Za-z0-9_-]+).*#https://www.instagram.com/\2/\3/#' <<<"$url")
slug=$(iconv -f utf8 -t ascii//TRANSLIT <<<"$title" | tr 'A-Z' 'a-z' | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//' | cut -c1-50)
dir="$(dirname "$0")/content/blog/$date-$slug"
[[ ! -e $dir ]] || { echo "Ya existe: $dir"; exit 1; }
mkdir -p "$dir"
cat > "$dir/index.md" <<MD
---
title: "${title//\"/\\\"}"
date: $date
tags: [Instagram]
---

<blockquote class="instagram-media" data-instgrm-permalink="$link" data-instgrm-version="14"></blockquote>
<script async src="//www.instagram.com/embed.js"></script>
MD
echo "Creado: $dir/index.md"
