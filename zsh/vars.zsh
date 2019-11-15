# Vagrant
#

export VAGRANT_DEFAULT_PROVIDER="virtualbox"

# ansible settings
export ANSIBLE_COW_SELECTION=tux

export USRLOCAL=/usr/local

export GOROOT=$USRLOCAL/opt/go/libexec
export GOPATH=$HOME/Go
export GOBIN=$GOPATH/bin
export GOVENDOREXPERIMENT=1

export VIMRUNTIME='/usr/local/share/vim/vim80'

# User configuration
export EDITOR=nvim
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$HOME/Library/Android/sdk/platform-tools:"${PATH}"
export PATH=":$GOROOT/bin:$GOPATH/bin:$USRLOCAL/bin:$USRLOCAL/sbin:$HOME/.rbenv/versions/2.6.3/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/.fzf/bin"
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#  Java
export ANDROID_HOME=/usr/local/opt/android-sdk
export XDG_CONFIG_HOME="$HOME/.config"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"


