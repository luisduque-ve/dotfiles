config.load_autoconfig()
c.hints.chars = "aoeuhtns"
c.fonts.hints = "20pt FiraCode Nerd Font Mono"
c.tabs.position = "left"
c.tabs.width = 150
c.completion.shrink = True
config.bind("<Alt-x>", "cmd-set-text :")
config.bind("<Alt-x>", "cmd-set-text :", mode="insert")


## google meet settings
with config.pattern("*://meet.google.com/*") as p:
    p.content.media.audio_video_capture = True
    p.content.notifications.enabled = True

## This is a workaround to fix a google meet permissions issue
## see here: https://github.com/qutebrowser/qutebrowser/issues/8539#issuecomment-2784470927
c.qt.args = ["disable-features=PermissionElement"]
