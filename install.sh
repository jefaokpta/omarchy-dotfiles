#!/bin/bash
# Restaura as preferências do desktop Omarchy deste repo.
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
TS=$(date +%s)
cd "$DIR/config"
find . -type f | while read -r f; do
  dst="$HOME/.config/${f#./}"
  mkdir -p "$(dirname "$dst")"
  [[ -f $dst ]] && ! cmp -s "$f" "$dst" && cp "$dst" "$dst.bak.$TS"
  cp "$f" "$dst"
done
[[ -f $HOME/.zshrc ]] && cp "$HOME/.zshrc" "$HOME/.zshrc.bak.$TS"
cp "$DIR/zshrc" "$HOME/.zshrc"
while read -r id url; do
  [[ -d $HOME/.config/omarchy/plugins/$id ]] || git clone "$url" "$HOME/.config/omarchy/plugins/$id"
done < "$DIR/plugins.txt"
omarchy theme set Hackerman || true
omarchy font set "GeometricJetBrainsMono Nerd Font" || true
hyprctl reload >/dev/null && hyprctl configerrors
echo "Pronto. Superwhisper (plugin superwhisper-panel) deve ser instalado à parte."
