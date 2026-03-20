from textual.app import App, ComposeResult
from textual.widgets import DataTable, Log
from textual.events import Key
import sqlite3
import py_package.SQL as SQL

class FocusUnitApp(App):
    CSS = "DataTable {height: 2fr}"
    BINDINGS = [("a", "set_focus", ""),]
    foo = ""
    CONN = sqlite3.connect("db/TLR.db")

    def compose(self) -> ComposeResult:
        yield Log()
        yield DataTable()

    def action_set_focus(self):
        log = self.query_one(Log)
        log.write_line("yo")

    def on_data_table_row_selected(self, event: DataTable.RowSelected) -> None:
        table = self.query_one(DataTable)
        # Use get_row with the key from the event to get the list of values
        row_data = table.get_row(event.row_key)
        self.foo = row_data
        # self.notify(f"Selected row data: {row_data}")
        log = self.query_one(Log)
        log.write_line(f"{self.foo}")

    # id, scenario_id, unit_name, faction, loc_x, loc_y
    def on_mount(self) -> None:
        table = self.query_one(DataTable)
        table.focus()
        SQL.generate_instance_table(self.CONN, table)
        table.cursor_type = "row"


app = FocusUnitApp()
if __name__ == "__main__":
    app.run()
