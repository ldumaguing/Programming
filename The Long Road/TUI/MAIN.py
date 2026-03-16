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
        ("backspace", "set_zero", ""),
    ]

    CONN = sqlite3.connect("db/TLR.db")
    count = 0

    def compose(self):
        yield Header()
        yield Footer()
        yield Log()

    def action_set_zero(self):
        self.count = 0
        log = self.query_one(Log)
        log.clear()

    def action_about_face(self):
        self.count += 1
        log = self.query_one(Log)
        foo = f"{self.count}"
        log.write_line(foo + " about face")
        # cmd.about_face(self.CONN)

    def action_turn_right(self):
        self.count += 1
        log = self.query_one(Log)
        foo = f"{self.count}"
        log.write_line(foo + " turn right")
        # cmd.turn_right(self.CONN)

    def action_turn_left(self):
        self.count += 1
        log = self.query_one(Log)
        foo = f"{self.count}"
        log.write_line(foo + " turn left")
        # cmd.turn_left(self.CONN)

    def action_move_forward(self):
        self.count += 1
        log = self.query_one(Log)
        foo = f"{self.count}"
        log.write_line(foo + " move forward")
        # cmd.move_forward(self.CONN)


if __name__ == "__main__":
    app = TUIApp()
    app.run()

