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
    stmt = "SELECT loc_x, loc_y, stack_lvl FROM instance WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    hexNstack = SQL.get_3columns(CONN, stmt)
    stmt = "UPDATE instance SET "
    stmt += f"loc_x = -1000 WHERE id = {unit_id}"
    SQL.execute_sql(CONN, stmt)
    restack_units(CONN, scenario_id, hexNstack)


def restack_units(CONN, scenario_id, hexNstack):
    x = hexNstack[0][0]
    y = hexNstack[0][1]
    s = hexNstack[0][2]
    stmt = "UPDATE instance SET "
    stmt += f"stack_lvl = (stack_lvl - 1) WHERE "
    stmt += f"loc_x = {x} AND loc_y = {y} AND stack_lvl > {s} AND "
    stmt += f"scenario_id = {scenario_id}"
    SQL.execute_sql(CONN, stmt)
