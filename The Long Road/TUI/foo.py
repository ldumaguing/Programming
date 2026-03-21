from textual.app import App, ComposeResult
from textual.widgets import Header, Log


class TUIApp(App):
    CSS_PATH = None
    BINDINGS = [
        ("f1", "foo1", ""),
        ("f2", "foo2", ""),
    ]

    def action_foo1(self):
        log = self.query_one(Log)
        log.write_line("foo1")
        self.sub_title = "foo1"

    def action_foo2(self):
        log = self.query_one(Log)
        log.write_line("foo2")
        self.sub_title = "foo2"

    def compose(self) -> ComposeResult:
        yield Header()
        yield Log()

    def on_mount(self) -> None:
        self.title = "The Long Road"
        self.sub_title = "foo1"


if __name__ == "__main__":
    app = TUIApp()
    app.run()
