set fish_key_bindings fish_user_key_bindings

set -l OS (uname)

# running on macos
if test "$OS" = Darwin
  # HOMEBREW
  if test -d /opt/homebrew
      /opt/homebrew/bin/brew shellenv | source
  end
end

# running on linux
if test "$OS" = Linux
  # KEYRING
  set -gx SSH_AUTH_SOCK /run/user/1000/keyring/ssh

  # HOMEBREW
  if test -d /home/linuxbrew/.linuxbrew
        # Homebrew is installed on Linux
        set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
        set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
        set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
        set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH
        set -q MANPATH; or set MANPATH ''
        set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
        set -q INFOPATH; or set INFOPATH ''
        set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
  
        # Homebrew asked for this in order to `brew upgrade`
        set -gx HOMEBREW_GITHUB_API_TOKEN {api token goes here, don't remember where that's created}
  end
end


set -g direnv_fish_mode disable_arrow
set -gx EDITOR $(which nvim)

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
# set -gx XDG_RUNTIME_DIR /run/user/$(id -u)

# ANDROID SDK
# set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$HOME/.local/share/android-sdk"
set A_SDK_TOOLS $ANDROID_SDK_ROOT"/cmdline-tools/latest/bin"
set A_SDK_PLATFORM_T $ANDROID_SDK_ROOT"/platform-tools"
set A_SDK_EMULATOR $ANDROID_SDK_ROOT"/emulator"
set -gx ANDROID_AVD_HOME "$HOME/.android/avd"
set -gx PATH $PATH $A_SDK_TOOLS $A_SDK_EMULATOR $A_SDK_PLATFORM_T

# FVM
set -e FVM_HOME
set FLUTTER_FVM_PATH "$HOME/.fvm/default/bin"
set -gx JAVA_OPTS "-XX:+IgnoreUnrecognizedVMOptions"
set -gx FVM_CACHE_PATH $HOME/.fvm
set -gx PATH $PATH $FLUTTER_FVM_PATH

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

# FLATPAK
set -gx PATH $PATH "$HOME/.local/share/flatpak/exports/share"

# LOCAL BIN
set -gx PATH $PATH "$HOME/.local/bin"


alias mpv-yt "mpv --ytdl-format=bestvideo[vcodec=vp9]+bestaudio/best"
alias yt "mpv --hwdec=auto"
alias startw "dbus-run-session Hyprland"

#direnv hook fish | source
starship init fish | source
atuin init fish | source
