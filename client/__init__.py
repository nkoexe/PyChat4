import os

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from gui import Window
from settings import Colors, Data, Settings


def main():
    os.chdir(os.path.dirname(os.path.abspath(__file__)))

    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    settings = Settings()
    colors = Colors()
    data = Data()

    window = Window(engine, theme=colors.getTheme(settings.theme))
    window.loadView('main')

    app.exec()


if __name__ == '__main__':
    main()
