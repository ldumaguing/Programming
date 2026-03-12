import sys
import py_package.SQL as SQL


def about_face(CONN):
    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'unitFocus'"
    unit_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'currScenario'"
    scenario_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT status FROM instance WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    X = int(SQL.get_field_value(CONN, stmt))
    status = X & 8191  # 1FFF
    facing = X >> 13
    facing += 3
    facing %= 6
    facing = facing << 13
    status = facing | status
    stmt = f"UPDATE instance SET status = {status} WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    SQL.execute_sql(CONN, stmt)


def turn_right(CONN):
    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'unitFocus'"
    unit_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'currScenario'"
    scenario_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT status FROM instance WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    X = int(SQL.get_field_value(CONN, stmt))
    status = X & 8191  # 1FFF
    facing = X >> 13
    facing += 1
    facing %= 6
    facing = facing << 13
    status = facing | status
    stmt = f"UPDATE instance SET status = {status} WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    SQL.execute_sql(CONN, stmt)


def turn_left(CONN):
    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'unitFocus'"
    unit_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'currScenario'"
    scenario_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT status FROM instance WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    X = int(SQL.get_field_value(CONN, stmt))
    status = X & 8191  # 1FFF
    facing = X >> 13
    facing -= 1
    if facing < 0:
        facing = 5
    facing = facing << 13
    status = facing | status
    stmt = f"UPDATE instance SET status = {status} WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    SQL.execute_sql(CONN, stmt)


def move_forward(CONN):
    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'unitFocus'"
    unit_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'currScenario'"
    scenario_id = SQL.get_field_value(CONN, stmt)

    stmt = "SELECT img_id, loc_x, loc_y, id, stack_lvl, status "
    stmt += "FROM instance WHERE "
    stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
    print(stmt)
    combatants = SQL.get_combatants(CONN, stmt)[0]
    x = combatants[1]
    y = combatants[2]
    status = combatants[5]
    facing = status >> 13
    print(facing)
    direction = facing + 1
    print(direction)
    if x % 2:  # x is odd
        print("odd")
        if direction == 1:
            y -= 1
        elif direction == 2:
            x += 1
            y -= 1
        elif direction == 3:
            x += 1
        elif direction == 4:
            y += 1
        elif direction == 5:
            x -= 1
        else:
            x -= 1
            y -= 1
    else:
        print("even")
        if direction == 1:
            y -= 1
        elif direction == 2:
            x += 1
        elif direction == 3:
            x += 1
            y += 1
        elif direction == 4:
            y += 1
        elif direction == 5:
            x -= 1
            y += 1
        else:
            x -= 1

    stmt = "UPDATE instance SET "
    stmt += f"loc_x = {x}, "
    stmt += f"loc_y = {y} WHERE "
    stmt += f"id = {unit_id} AND "
    stmt += f"scenario_id = {scenario_id}"
    SQL.execute_sql(CONN, stmt)
