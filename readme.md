# dotfiles
Personal dotfiles and configuration for macOS development, including shell, git, vim, SSH, and IDE settings.

## How to use
Clone to home directory and run `setup.sh`:
```bash
git clone git@github.com:ellenzchang/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

Set up iTerm color scheme using `iterm/ayu.itermcolors`.

Open vim in iTerm and source the config:
```vim
:source ~/.vimrc
```

For additional setup, follow the sections below.

#### Table of Contents
1. [Rectangle setup](#1-rectangle-setup)
2. [SSH setup](#2-ssh-setup)
3. [IntelliJ setup](#3-intellij-setup)
4. [AI-related setup](#4-ai-related-setup)

### 1. Rectangle setup

Open Rectangle and import the settings from `RectangleConfig.json`.

### 2. SSH setup
Before running `setup.sh`, set up SSH keys:

1. Generate work and personal keys:
```bash
mkdir -p ~/.ssh/work ~/.ssh/personal
ssh-keygen -t ed25519 -C "your-work-email" -f ~/.ssh/work/id_ed25519
ssh-keygen -t ed25519 -C "your-personal-email" -f ~/.ssh/personal/id_ed25519
```

2. Copy the gitconfig files into the SSH directories:
```bash
cp ~/.ssh/work/.gitconfig   # from existing machine or create with [user] name/email and [core] sshCommand
cp ~/.ssh/personal/.gitconfig
```

3. Add keys to the agent:
```bash
ssh-add ~/.ssh/work/id_ed25519
ssh-add ~/.ssh/personal/id_ed25519
```

4. Add the public keys to GitHub:
   - `~/.ssh/work/id_ed25519.pub` → github.schibsted.io and github.com
   - `~/.ssh/personal/id_ed25519.pub` → github.com

5. Run `setup.sh` — it will copy `git/ssh_config` to `~/.ssh/config` if it doesn't exist.

6. Verify:
```bash
ssh -T git@github.schibsted.io
ssh -T git@github.com
```

### 3. IntelliJ setup

1. In the Project window, click ⋮ Options > Behavior > Always Select Opened File

2. Install IdeaVim plugin and source the config within a file:
```vim
:source ~/.vimrc
```

### 4. AI-related setup
- [fastsetup](https://github.com/fastai/fastsetup/tree/master) (not necessary with IntelliJ since it sets up envs automatically)
