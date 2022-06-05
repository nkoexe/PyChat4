from PySide6.QtCore import QObject, Slot


class QMLBackend(QObject):
    def __init__(self):
        super(QMLBackend, self).__init__()

    @Slot(str)
    def loadView(self, view):
        self.root.loadView(view)
