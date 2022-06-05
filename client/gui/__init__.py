import os
from pathlib import Path

from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot


class Window(QObject):
    def __init__(self, engine: QQmlApplicationEngine, theme: dict):
        super(Window, self).__init__()

        self.engine = engine

        self.engine.rootContext().setContextProperty('colors', theme)
        self.engine.rootContext().setContextProperty('backend', self)
        self.engine.load(os.fspath(Path(__file__).resolve().parent / 'qml' / 'base.qml'))

        self.root = self.engine.rootObjects()[0]

    @Slot(str)
    def loadView(self, view: str):
        self.root.loadView(view)

    @Slot(str)
    def setTheme(self, theme: dict):
        self.engine.rootContext().setContextProperty('colors', theme)
