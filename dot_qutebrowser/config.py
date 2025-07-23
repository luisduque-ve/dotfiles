config.load_autoconfig()
c.tabs.position = "left"
c.tabs.width = 150
c.completion.shrink = True
config.bind("<Alt-x>", "cmd-set-text :")
config.bind("<Alt-x>", "cmd-set-text :", mode="insert")
