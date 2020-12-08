export default {
    description: 'Installs and updates packages via the pacman package manager',
    variables: {
        packages: [
            'adobe-source-code-pro-fonts', // Monospace programming font.
            'bluez', // Bluetooth stack.
            'bluez-utils', // Provides `bluetoothctl` CLI tool for pairing etc (see: https://wiki.archlinux.org/index.php/Bluetooth).
            'caja', // File manager from MATE desktop.
            'chromium', // Web browser.
            'clang', // Compiler toolchain (eg. used for Neovim LSP).
            'cmake', // Build tool (eg. used to build Neovim).
            'dmenu', // Item selection UI.
            'dunst', // Notification daemon (eg. for clock dropdown in status bar).
            'feh', // Sets desktop background.
            'git', // Version control system.
            'gnome-icon-theme', // eg. for clock icon in dunst notifications.
            'happy', // Haskell golden testing library (needed for docvim).
            'herbstluftwm', // (Non-default) window manager; will probably remove.
            'i3', // Window manager.
            'i3blocks', // Status bar.
            'jq', // JSON parser.
            'kitty', // Terminal emulator.
            'mlocate', // Find files by name with `locate`.
            'netcat', // For piping over network connectison (see also `socat` below).
            'openssh', // SSH tools.
            'otf-font-awesome', // Icon font (eg. for status bar).
            'picom', // X compositor (eg. window transparency etc).
            'pulseaudio-bluetooth',
            'python-neovim', // Support for running Python plugins in Neovim.
            'ripgrep', // Grep replacement.
            'ruby', // Scripting language.
            'screenkey', // Shows keyboard interactions for screencasting.
            'skim', // Fuzzy finder.
            'socat', // Netcat replacement with UNIX domain socket (etc) support.
            'stack', // Haskell environment.
            'sxhkd', // Hotkey daemon for X (eg. open Dmenu with Super+Space).
            'tree', // CLI file hierarchy viewer.
            'unzip', // For extracting and viewing .zip archive contents.
            'vi', // Original vi text editor.
            'vim', // Vim (vi improved) text editor.
            'xautolock', // Screen locker with hot-corner support.
            'xcape', // Allows keys to have distinct tap-vs-chord behavior in X.
            'xclip', // CLI access to X clipboard.
            'xdo', // Window utility for X, used to implement "swallow" functionality.
            'xorg', // Window system.
            'xorg-xinit', // X initializer.
            'xsecurelock', // Secure screen lock from Google.
            'zsh', // Shell.
        ],
    },
};