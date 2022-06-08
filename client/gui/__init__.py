import os
from pathlib import Path

from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QColor


class Window(QObject):
    def __init__(self, engine: QQmlApplicationEngine, theme: dict):
        super(Window, self).__init__()

        self.engine = engine
        self.rootcontext = self.engine.rootContext()

        self.setTheme(theme)
        self.rootcontext.setContextProperty('backend', self)

        self.engine.load(os.fspath(Path(__file__).resolve().parent / 'qml' / 'base.qml'))

        self.root = self.engine.rootObjects()[0]

    @Slot(str)
    def loadView(self, view: str):
        self.root.loadView(view)

    @Slot(str)
    def setTheme(self, theme: dict):
        for i in theme:
            theme[i] = QColor(theme[i])

        self.rootcontext.setContextProperty('colors', theme)
