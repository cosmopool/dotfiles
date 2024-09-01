config.load_autoconfig(True)

# Bindings
# ---------------------
config.unbind("H")
config.unbind("J")
config.unbind("K")
config.unbind("L")
config.bind("z;", "tab-next")
config.bind("K", "back")
config.bind("L", "forward")
config.bind("zj", "tab-prev")

config.unbind("h")
config.unbind("j")
config.unbind("k")
config.unbind("l")
config.bind("j", "scroll left")
config.bind("k", "scroll down")
config.bind("l", "scroll up")
config.bind(";", "scroll right")

# hint
config.bind("af", "hint all tab-fg")
config.bind("ab", "hint all tab-bg")
config.bind("ai", "hint images")
config.bind("aI", "hint images tab-bg")
config.bind("al", "hint links")
config.bind("aL", "hint links tab-fg")
