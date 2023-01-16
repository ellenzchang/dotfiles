# symbiotic links
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/.gitignore_global ~/.gitignore_global

brew install git kubectl maven node yarn diff-so-fancy zsh zsh-autosuggestions autojump
brew install firefox iterm2 slack spotify intellij-idea 1password rectangle google-chrome docker java jetbrains-tool --cask

# for better looking terminal
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
