import py_package.SQL as SQL


def get_combatants_in_hex(CONN, scenario_id, unit):
    stmt = "SELECT id, stack_lvl FROM instance WHERE "
    stmt += f"loc_x = {unit[1]} AND loc_y = {unit[2]} "
    stmt += f"AND scenario_id = {scenario_id}"
    return SQL.get_2columns(CONN, stmt)


def place(CONN, scenario_id, unit):
    if SQL.is_same_place(CONN, scenario_id, unit):
        return
    stack_lvl = len(get_combatants_in_hex(CONN, scenario_id, unit))
    stmt = "UPDATE instance SET "
    stmt += f"stack_lvl = {stack_lvl}, "
    stmt += f"loc_x = {unit[1]}, loc_y = {unit[2]} "
    stmt += f"WHERE id = {unit[0]} "
    stmt += f"AND scenario_id = {scenario_id}"
    SQL.execute_sql(CONN, stmt)


def remove_combatant(CONN, scenario_id, unit_id):
    stmt = "UPDATE instance SET "
    stmt += f"loc_x = -1000 WHERE id = {unit_id}"
    SQL.execute_sql(CONN, stmt)
