import os
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from gui import Window
from settings import Colors, Data, Settings


def main():
    os.chdir(os.fspath(Path(__file__).resolve().parent))

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
