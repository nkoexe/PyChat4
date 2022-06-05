from configparser import ConfigParser


class Settings:
    def __init__(self):
        self.configfile = ConfigParser()
        self.configfile.read('settings.ini')

        self.theme = self.configfile.get('general', 'theme')


class Colors:
    def __init__(self):
        self.configfile = ConfigParser()
        self.configfile.read('colors.ini')

    def getTheme(self, theme: str):
        return dict(self.configfile[theme])


class Data:
    def __init__(self):
        self.configfile = ConfigParser()
        self.configfile.read('data.ini')
