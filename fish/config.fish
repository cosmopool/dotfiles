set fish_key_bindings fish_user_key_bindings

# eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

set -g direnv_fish_mode disable_arrow
set -gx EDITOR $(which nvim)
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
# set -gx XDG_RUNTIME_DIR /run/user/$(id -u)

# ANDROID SDK
# set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$HOME/.local/share/android-sdk"
set A_SDK_TOOLS $ANDROID_SDK_ROOT"/cmdline-tools/latest/bin"
set A_SDK_PLATFORM_T $ANDROID_SDK_ROOT"/platform-tools"
set A_SDK_EMULATOR $ANDROID_SDK_ROOT"/emulator"
set -gx ANDROID_AVD_HOME "$HOME/.config/.android/avd"
set -gx PATH $PATH $A_SDK_TOOLS $A_SDK_EMULATOR $A_SDK_PLATFORM_T

# FVM
set -e FVM_HOME
set FLUTTER_FVM_PATH "$HOME/fvm/default/bin"
set -gx JAVA_OPTS "-XX:+IgnoreUnrecognizedVMOptions"
set -gx FVM_CACHE_PATH $HOME/.fvm
set -gx PATH $PATH $HYPRLAND_SCRIPTS

# FLUTTER
set -gx CHROME_EXECUTABLE /usr/bin/chromium
set -gx PATH $PATH "$HOME/.pub-cache/bin"

# HYPRLAND
set HYPRLAND_SCRIPTS "$XDG_CONFIG_HOME/hypr/scripts"
set -gx PATH $PATH $HYPRLAND_SCRIPTS

# ZVM
set -gx ZVM_INSTALL "$HOME/.zvm/self"
set -gx PATH $PATH "$HOME/.zvm/bin"
set -gx PATH $PATH "$ZVM_INSTALL/"

# GO
set -gx GOPATH $HOME/go
set -gx PATH $PATH "$GOPATH/bin"

set -gx PATH $PATH "$HOME/.local/bin" "$HOME/.local/share/flatpak/exports/share"


alias mpv-yt "mpv --ytdl-format=bestvideo[vcodec=vp9]+bestaudio/best"
alias yt "mpv --hwdec=auto"
alias startw "dbus-run-session Hyprland"

#direnv hook fish | source
starship init fish | source
atuin init fish | source
