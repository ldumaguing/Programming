import py_package.COMMANDS as cmd
import sqlite3
from textual.app import App, ComposeResult
from textual.widgets import Footer, Header, Log


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
        yield Log()

    def action_about_face(self):
        log = self.query_one(Log)
        log.write_line("about face")
        # cmd.about_face(self.CONN)

    def action_turn_right(self):
        log = self.query_one(Log)
        log.write_line("turn right")
        # cmd.turn_right(self.CONN)

    def action_turn_left(self):
        log = self.query_one(Log)
        log.write_line("turn left")
        # cmd.turn_left(self.CONN)

    def action_move_forward(self):
        log = self.query_one(Log)
        log.write_line("move forward")
        # cmd.move_forward(self.CONN)


if __name__ == "__main__":
    app = TUIApp()
    app.run()
