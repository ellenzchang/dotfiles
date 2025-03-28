# symbolic links
ln -sfn ~/dotfiles/zsh/.zshrc ~/.zshrc 
ln -sfn ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -sfn ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sfn ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sfn ~/dotfiles/git/.gitignore_global ~/.gitignore_global

brew install git kubectl maven node yarn diff-so-fancy zsh zsh-autosuggestions autojump htop task git-lfs thefuck asdf
for app in firefox iterm2 slack spotify 1password rectangle google-chrome docker temurin jetbrains-toolbox; do
  brew install --cask "$app" || echo "❌ Failed to install $app"
done

# finn specific
brew untap finn/brew
brew tap finn/brew git@github.schibsted.io:finn/homebrew-brew.git
brew install finn

# for better looking terminal
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git lfs install
