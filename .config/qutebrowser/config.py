config.load_autoconfig(False)

config.bind('h', 'scroll left')
config.bind('t', 'scroll down')
config.bind('n', 'scroll up')
config.bind('s', 'scroll right')

config.bind('H', 'back')
config.bind('T', 'tab-prev')
config.bind('N', 'tab-next')
config.bind('S', 'forward')

config.bind('e', 'hint all')
config.bind('E', 'hint all tab')

config.bind('l', 'search-next')
config.bind('L', 'search-prev')

c.hints.chars = 'aoeuidhtns'
c.downloads.location.directory = '~/rxv'

c.content.pdfjs = True

c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True
