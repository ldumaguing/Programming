from textual.app import App, ComposeResult
from textual.widgets import DataTable, Log
import sqlite3
import py_package.SQL as SQL


class ActivatorApp(App):
    CSS = "DataTable {height: 2fr}"
    CONN = sqlite3.connect("db/TLR.db")

    def compose(self) -> ComposeResult:
        yield Log()
        yield DataTable()

    # id, scenario_id, unit_name, faction, loc_x, loc_y
    def on_mount(self) -> None:
        table = self.query_one(DataTable)
        table.focus()
        SQL.generate_instance_table(self.CONN, table)
        table.cursor_type = "row"


app = ActivatorApp()
if __name__ == "__main__":
    app.run()
