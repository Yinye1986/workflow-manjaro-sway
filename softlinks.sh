#!/bin/bash

# for users
# ~/
ln -sf /const/workflow-manjaro-sway/homeDir/.gitconfig $HOME/.gitconfig


# ~/.config/
rm -rf $HOME/.config/sway
#rm -rf $HOME/.config/waybar
rm -rf $HOME/.config/environment.d
#rm -rf $HOME/.config/profile.d
rm -rf $HOME/.config/alacritty
rm -rf $HOME/.config/mihomo
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/yazi
rm -rf $HOME/.config/fcitx5

ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/environment.d $HOME/.config/environment.d
# ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/profile.d $HOME/.config/profile.d
ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/sway $HOME/.config/sway
# ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/waybar $HOME/.config/waybar
ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/alacritty $HOME/.config/alacritty
ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/mihomo $HOME/.config/mihomo
ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/nvim $HOME/.config/nvim
ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/yazi $HOME/.config/yazi
ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/fcitx5 $HOME/.config/fcitx5

ssh-keygen -t ed25519 -C "yinye1986@gmail.com"




# for admin
sudo rm -rf /root/.config/yazi
sudo rm -rf /root/.config/nvim
sudo ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/yazi /root/.config/yazi
sudo ln -sf /const/workflow-manjaro-sway/homeDir/dotConfig/nvim /root/.config/nvim

