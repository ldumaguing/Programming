import py_package.COMMANDS as cmd
import sqlite3
from textual.app import App, ComposeResult
from textual.widgets import Footer, Header


class TUIApp(App):
    BINDINGS = [
        ("w", "move_forward", ""),
        ("a", "turn_left", ""),
        ("d", "turn_right", ""),
        ("s", "about_face", ""),
    ]
    CONN = sqlite3.connect("db/TLR.db")

    def compose(self):
        yield Header()
        yield Footer()

    def action_about_face(self):
        self.theme = (
            "textual-dark" if self.theme == "textual-light" else "textual-light"
        )
        cmd.about_face(self.CONN)

    def action_turn_right(self):
        self.theme = (
            "textual-dark" if self.theme == "textual-light" else "textual-light"
        )
        cmd.turn_right(self.CONN)

    def action_turn_left(self):
        self.theme = (
            "textual-dark" if self.theme == "textual-light" else "textual-light"
        )
        cmd.turn_left(self.CONN)

    def action_move_forward(self):
        self.theme = (
            "textual-dark" if self.theme == "textual-light" else "textual-light"
        )
        cmd.move_forward(self.CONN)


if __name__ == "__main__":
    app = TUIApp()
    app.run()
