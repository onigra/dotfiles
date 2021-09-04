```sh
./setup.sh
./brew_install.sh
./ruby_install.sh
```

- Growl
- [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)

# パッチ当て済みRictyをインストール

# iterm colorscheme

[mbadolato/iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)

# Sierra以降

## Carabiner-Elementsの設定

```sh
cp karabiner/assets/complex_modifications/slack.json ~/.config/karabiner/assets/complex_modifications/slack.json
```

# Sierra以前

## carabinerの設定

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
  <appdef>
    <appname>SLACK</appname>
    <equal>com.tinyspeck.slackmacgap</equal>
  </appdef>
  <list>
    <item>
      <name>Leave Insert Mode with EISUU (vim keybind apps)</name>
      <identifier>private.vim_keybind_apps_esc_with_eisuu</identifier>
      <only>iTERM2,TERMINAL,MACVIM</only>
      <autogen>--KeyToKey-- KeyCode::ESCAPE, KeyCode::ESCAPE, KeyCode::JIS_EISUU</autogen>
      <autogen>--KeyToKey-- KeyCode::BRACKET_LEFT, VK_CONTROL, KeyCode::BRACKET_LEFT, VK_CONTROL, KeyCode::JIS_EISUU</autogen>
    </item>
    <item>
      <name>For Slack CTRL+N=move next channel, CTRL+P=move previous channel, ALT+A=move unread channel</name>
      <identifier>private.app_slack_move_channel_with_ctrln_ctrlp</identifier>
      <only>SLACK</only>
      <autogen>__KeyToKey__ KeyCode::N, ModifierFlag::CONTROL_L, KeyCode::CURSOR_DOWN, ModifierFlag::OPTION_L</autogen>
      <autogen>__KeyToKey__ KeyCode::P, ModifierFlag::CONTROL_L, KeyCode::CURSOR_UP, ModifierFlag::OPTION_L</autogen>
      <autogen>__KeyToKey__ KeyCode::A, ModifierFlag::OPTION_L, KeyCode::CURSOR_DOWN, ModifierFlag::OPTION_L, ModifierFlag::SHIFT_L</autogen>
    </item>
  </list>
</root>
```

