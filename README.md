# omarchy-dotfiles

Minhas preferências do desktop [Omarchy](https://omarchy.org/) (v4.5).

- **Tema:** Hackerman · **Fonte:** GeometricJetBrainsMono Nerd Font
- **Hyprland:** rolagem natural (mouse e touchpad); monitores HDMI-A-1 (esquerda) + eDP-1 (direita), escala 1
- **Barra:** relógio com dia e data (`ddd dd/MM HH:mm`), calendário `derekross.calendar` no centro, `omarchy.elsewhen` com São Paulo/Londres/Dubai/Tóquio/LA, `takitani.sysmetrics`, tray do Superwhisper
- **Atalhos:** `Super+Shift+W` WhatsApp, `Super+Shift+C` Google Chat, `Super+Shift+V` VS Code, `Super+Shift+I` IntelliJ IDEA, `Super+S` console Quake com o Claude (85% altura × 90% largura, em `hypr/hyprland.lua`); agente padrão `claude`
- **Terminais:** foot e ghostty usando zsh
- **zsh:** Oh My Zsh com `fzf`, menu de completar navegável, completar sem diferenciar maiúsculas, `zsh-autosuggestions`, `zsh-syntax-highlighting` e `zsh-completions`
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
3. Instala os pacotes de plugins do zsh.
4. Instala o web app do Google Chat.
5. Aplica o tema Hackerman e a fonte GeometricJetBrainsMono Nerd Font.
6. Recarrega o Hyprland e mostra os erros de config, se tiver algum.

Depois:
- Instale o Superwhisper à parte, porque o plugin `superwhisper-panel` não vem neste repo.
- Se os monitores forem outros, ajuste `~/.config/hypr/monitors.lua`.
- Rode `gh auth login` para refazer as credenciais do git.
