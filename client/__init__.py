from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from gui.main import MainWindow

if __name__ == '__main__':
    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    main = MainWindow(engine)

    exit(app.exec())
