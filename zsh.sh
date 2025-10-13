# Shell looks
#
# Ref:
# https://www.geeksforgeeks.org/linux-unix/how-to-make-linux-terminal-look-awesome/
# https://medium.com/@mdomer19967/how-to-make-your-boring-macos-terminal-look-so-much-better-dd7f80ffeedc

# install zsh
sudo apt-get install zsh

# make zsh default terminal
chsh -s $(which zsh)
# change default terminal path in Konsole/Terminal app
echo "NOTE: Change default terminal path to zsh in Shell application"
echo "Once done, press enter..."
read dummy

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo "NOTE: Change ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc"
echo "Once done, press enter..."
read dummy

# install autosuggestions
# Ref: https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df
sudo apt install zsh-autosuggestions zsh-syntax-highlighting zsh

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

echo "NOTE: In .zshrc, change `plugins=(git)` to `plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)`"
echo "Once done, press enter..."
read dummy

