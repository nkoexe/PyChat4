from configparser import ConfigParser
from pathlib import Path


BASEPATH = Path(__file__).resolve().parent


class FileAPI:
    def load(self, file):
        self.file = file

        self.config = ConfigParser()
        self.config.read(BASEPATH / file)

    def get(self, section=None, option=None):
        if section is None:
            return self.config.sections()

        if option is None:
            return self.config[section]

        return self.config.get(section, option)

    def set(self, section, option, value):
        self.config.set(section, option, value)

    def save(self):
        with open(self.file, 'w') as f:
            self.config.write(f, space_around_delimiters=True)


class Settings(FileAPI):
    """
    API for the settings.ini file

    Required attributes:
    theme: str
    """

    def __init__(self):
        self.load('settings.ini')

        self.theme = self.get('general', 'theme')


class Colors(FileAPI):
    """
    API for the colors.ini file

    Required functions:
    getTheme(theme: str) -> dict  # dict with color_name: color_value pairs of the given theme
    """

    def __init__(self):
        self.load('colors.ini')

        self.themes = self.get()

    def getTheme(self, theme: str) -> dict:
        return dict(self.get(theme))


class Data(FileAPI):
    def __init__(self):
        self.load('data.ini')
