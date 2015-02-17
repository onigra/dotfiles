```sh
./setup.sh
./brew_install.sh
./ruby_install.sh
```
- [chrome](https://www.google.co.jp/chrome/browser/desktop/index.html)
- [vagrant](https://www.vagrantup.com/downloads.html)
- [Mailbox](http://www.mailboxapp.com/download/mac/)
- [gyazo](https://gyazo.com/ja)
- Growl
- [GrowlNotify](http://growl.cachefly.net/GrowlNotify-2.1.zip)
- [MacVim-Kaoriya](https://github.com/splhack/macvim/releases)

# tmuxを1.8にする

```sh
brew remove tmux
cd /usr/local/
git checkout c356bf7 Library/Formula/tmux.rb
brew install tmux
```

# NeoBundleInstall

# パッチ当て済みRictyをインストール

# carabinerの設定

- Change Key
  - コマンドキーの動作を優先モード1
- Key Repeat
  - Key Repeat
    - Delay Until Repeat 200
    - Key Repeat 23
  - Functional Key Repeat
    - Delay Until Repeat 200
    - Key Repeat 220

- insertモード抜けたら自動的に英数入力にする設定
  - Misc & Uninstall
    - Open private.xmlからxmlを編集

```xml
<?xml version="1.0"?>
<root>
  <appdef>
    <appname>iTERM2</appname>
    <equal>com.googlecode.iterm2</equal>
  </appdef>
  <appdef>
    <appname>MACVIM</appname>
    <equal>org.vim.MacVim</equal>
  </appdef>
  <list>
    <item>
      <name>Leave Insert Mode with EISUU (vim keybind apps)</name>
      <identifier>private.vim_keybind_apps_esc_with_eisuu</identifier>
      <only>iTERM2,TERMINAL,MACVIM</only>
      <autogen>--KeyToKey-- KeyCode::ESCAPE, KeyCode::ESCAPE, KeyCode::JIS_EISUU</autogen>
      <autogen>--KeyToKey-- KeyCode::BRACKET_LEFT, VK_CONTROL, KeyCode::BRACKET_LEFT, VK_CONTROL, KeyCode::JIS_EISUU</autogen>
    </item>
  </list>
</root>
```

# iterm colorscheme

[mbadolato/iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
