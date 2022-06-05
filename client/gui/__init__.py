import os
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from .backend import QMLBackend


class Window(QMLBackend):
    def __init__(self, engine: QQmlApplicationEngine, theme: dict):
        super(Window, self).__init__()

        self.engine = engine

        self.engine.rootContext().setContextProperty('colors', theme)
        self.engine.rootContext().setContextProperty('backend', self)
        self.engine.load(os.fspath(Path(__file__).resolve().parent / 'qml' / 'base.qml'))

        self.root = self.engine.rootObjects()[0]
