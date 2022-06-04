import os
from pathlib import Path

from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject


class MainWindow(QObject):
    def __init__(self, engine: QQmlApplicationEngine):
        engine.load(os.fspath(Path(__file__).resolve().parent / 'qml' / 'main.qml'))


if __name__ == '__main__':
    from PySide6.QtGui import QGuiApplication

    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    main = MainWindow(engine)

    exit(app.exec())
