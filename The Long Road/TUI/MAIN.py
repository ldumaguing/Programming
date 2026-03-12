import py_package.COMMANDS as cmd
import sqlite3
from textual.app import App, ComposeResult
from textual.widgets import Footer, Header


class TUIApp(App):
    BINDINGS = [("w", "move_forward", "Toggle dark mode")]

    def compose(self):
        yield Header()
        yield Footer()

    def action_move_forward(self):
        self.theme = (
            "textual-dark" if self.theme == "textual-light" else "textual-light"
        )
        CONN = sqlite3.connect("db/TLR.db")
        cmd.move_forward(CONN)
        CONN.close()

if __name__ == "__main__":
    app = TUIApp()
    app.run()
