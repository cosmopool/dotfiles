set fish_key_bindings fish_user_key_bindings

set BREW_BIN $(which brew)
eval "$($BREW_BIN shellenv)"

set -g direnv_fish_mode disable_arrow

set -gx EDITOR $(which nvim)
set -gx CHROME_EXECUTABLE /usr/bin/chromium
set -gx GOPATH $HOME/go
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
# set -gx XDG_RUNTIME_DIR /run/user/$(id -u)

# set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$HOME/.local/share/android-sdk"
set A_SDK_TOOLS $ANDROID_SDK_ROOT"/cmdline-tools/latest/bin"
set A_SDK_PLATFORM_T $ANDROID_SDK_ROOT"/platform-tools"
set A_SDK_EMULATOR $ANDROID_SDK_ROOT"/emulator"
# set -gx ANDROID_AVD_HOME "$HOME/.android/avd/"
set FLUTTER_FVM_PATH "$HOME/fvm/default/bin"
set -gx JAVA_OPTS "-XX:+IgnoreUnrecognizedVMOptions"

set -gx PATH $PATH $FLUTTER_FVM_PATH $ANDROID_SDK_ROOT $A_SDK_TOOLS $A_SDK_EMULATOR $A_SDK_PLATFORM_T "$HOME/.local/bin" "$HOME/bin" "$HOME/.pub-cache/bin" "$HOME/bin" "$GOPATH/bin" "$HOME/.local/share/flatpak/exports/share" "$HOME/Git/v"
# set -gx PATH $PATH $FLUTTER_FVM_PATH "$HOME/.local/bin" "$HOME/bin" "$GOPATH/bin" "$HOME/.local/share/flatpak/exports/share"

alias mpv-yt "mpv --ytdl-format=bestvideo[vcodec=vp9]+bestaudio/best"
alias yt "mpv --hwdec=auto"

#direnv hook fish | source
starship init fish | source
atuin init fish | source
