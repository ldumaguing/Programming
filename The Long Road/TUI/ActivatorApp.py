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

    def on_data_table_row_selected(self, event: DataTable.RowSelected) -> None:
        table = self.query_one(DataTable)
        row_data = table.get_row(event.row_key)
        unit_id = row_data[0]
        SQL.activate_unit(self.CONN, unit_id)
        table = self.query_one(DataTable)
        table.clear()
        # table.focus()
        SQL.generate_instance_table(self.CONN, table)
        table.cursor_type = "row"
        # log = self.query_one(Log)
        # log.write_line(f"{event.cursor_row}")
        table.cursor_coordinate = (event.cursor_row, 0)

    def on_mount(self) -> None:
        table = self.query_one(DataTable)
        # table.focus()
        table.add_columns("ID", "Name", "Faction", "X", "Y", "")
        SQL.generate_instance_table(self.CONN, table)
        table.cursor_type = "row"


app = ActivatorApp()
if __name__ == "__main__":
    app.run()
