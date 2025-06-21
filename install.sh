cd ~
if hash pacman 2>/dev/null; then
	sudo pacman -yS --noconfirm --needed pacman-contrib
	sudo sh -c "curl -s \"https://www.archlinux.org/mirrorlist/?country=AU&country=HK&country=JP&country=NZ&country=SG\" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 6 - >| /etc/pacman.d/mirrorlist"
	sudo pacman -Syu --noconfirm
	sudo pacman -yS --noconfirm --needed git vim cmake base-devel fzf
	git clone https://github.com/otto-dev/Dotfiles.git ~/Dotfiles
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm --needed
	cd ~
	rm -rf ~/yay
fi
if [ ! -d ~/Dotfiles ]; then
	echo "~/Dotfiles does not exist"
	exit
fi
ln -sf ~/Dotfiles/bashrc ~/.bashrc
ln -sf ~/Dotfiles/fzf.bash ~/.fzf.bash
mkdir -p ~/.vim
ln -sf ~/Dotfiles/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c ':silent PlugInstall | quitall' || true
ln -sf ~/Dotfiles/vim/* ~/.vim/
# CoC extensions will be installed on first vim launch
