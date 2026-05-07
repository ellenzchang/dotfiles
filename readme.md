# dotfiles
Simply clone to home and run `setup.sh`

Setup iterm color scheme using `iterm/ayu.itermcolors`

Go into vim with `vim` and run
```bash
:source ~/.vimrc
```


## Rectangle setup

Open Rectangle and import the settings from the following file:

```bash
RectangleConfig.json
```

## ssh setup
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

## IntelliJ setup

1. In the Project window, click ⋮ Options > Behavior > Always Select Opened File

2. Install IdeaVim plugin and run the following command within a file
```bash
:source ~/.vimrc
```


# ai related setup
- fastsetup: https://github.com/fastai/fastsetup/tree/master (not necessary with intellij since they setup envs automatically for you)
