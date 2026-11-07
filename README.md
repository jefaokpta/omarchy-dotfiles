# omarchy-dotfiles

Minhas preferências do desktop [Omarchy](https://omarchy.org/) (v4.5).

- **Tema:** Hackerman · **Fonte:** GeometricJetBrainsMono Nerd Font
- **Hyprland:** rolagem natural (mouse e touchpad); monitores HDMI-A-1 (esquerda) + eDP-1 (direita), escala 1
- **Barra:** calendário `derekross.calendar` no centro, `omarchy.elsewhen` com São Paulo/Londres/Dubai/Tóquio/LA, `takitani.sysmetrics`, tray do Superwhisper
- **Terminais:** foot e ghostty usando zsh
- **Outros:** git, tmux, starship, nvim, zshrc, branding, hook `theme-set` do owe

## Como restaurar

Numa instalação nova do Omarchy:

```bash
git clone https://github.com/jefaokpta/omarchy-dotfiles
cd omarchy-dotfiles
./install.sh
```

O script:
1. Copia tudo de `config/` para `~/.config/` e o `zshrc` para `~/.zshrc`, salvando antes um backup `.bak.<timestamp>` de cada arquivo que for sobrescrever.
2. Clona os plugins da barra listados em `plugins.txt`.
3. Aplica o tema Hackerman e a fonte GeometricJetBrainsMono Nerd Font.
4. Recarrega o Hyprland e mostra os erros de config, se tiver algum.

Depois:
- Instale o Superwhisper à parte, porque o plugin `superwhisper-panel` não vem neste repo.
- Se os monitores forem outros, ajuste `~/.config/hypr/monitors.lua`.
- Rode `gh auth login` para refazer as credenciais do git.
