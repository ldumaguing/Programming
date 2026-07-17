// to compile:
// zig build-exe <foo>.zig -lc -lsqlite3
const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    const html_1 =
        \\<!DOCTYPE html>
        \\<html>
        \\<head>
        \\   <meta charset="UTF-8">
        \\   <title>{s}</title>
        \\</head>
        \\<body>
        \\<table>
        \\
    ;
    const html_2 =
        \\</table>
        \\</body>
        \\</html>
        \\
    ;

    print(html_1, .{"Catalog"});
    show_imgs(db);
    print(html_2, .{});
}

fn show_imgs(db: ?*c.sqlite3) void {
    // ********** 2: prepare statement
    const query =
        \\SELECT id, file, flag1,
        \\apf_val, apf_rng, apf2_val, apf2_rng,
        \\hef_val, hef_rng, hef2_val, hef2_rng,
        \\mf_val,
        \\caf_val, flag2, armor_val,
        \\flag3, ability1, ability2, ability3
        \\FROM img WHERE (flag1 & 2)
    ;

    var stmt: ?*c.sqlite3_stmt = undefined;
    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // ********** 3: loop result
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        const id = c.sqlite3_column_int64(stmt, 0);
        const fname = c.sqlite3_column_text(stmt, 1);
        const flag1 = c.sqlite3_column_int64(stmt, 2);
        const apf_val = c.sqlite3_column_int64(stmt, 3);
        const apf_rng = c.sqlite3_column_text(stmt, 4);
        const apf2_val = c.sqlite3_column_int64(stmt, 5);
        const apf2_rng = c.sqlite3_column_text(stmt, 6);
        const hef_val = c.sqlite3_column_int64(stmt, 7);
        const hef_rng = c.sqlite3_column_text(stmt, 8);
        const hef2_val = c.sqlite3_column_int64(stmt, 9);
        const hef2_rng = c.sqlite3_column_text(stmt, 10);
        const mf_val = c.sqlite3_column_int64(stmt, 11);
        const caf_val = c.sqlite3_column_int64(stmt, 12);
        const flag2 = c.sqlite3_column_int64(stmt, 13);
        const armor_val = c.sqlite3_column_int64(stmt, 14);
        const flag3 = c.sqlite3_column_int64(stmt, 15);
        const ability1 = c.sqlite3_column_int64(stmt, 16);
        const ability2 = c.sqlite3_column_int64(stmt, 17);
        const ability3 = c.sqlite3_column_int64(stmt, 18);

        print("   <tr>", .{});
        print("<td>{d}</td><td><img src=\"TLR/{s}\"></td>", .{ id, fname });

        if (apf_val >= 0) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});
            process_APF(flag1, apf_val, apf_rng);
            if (apf2_val >= 0)
                process_APF2(apf2_val, apf2_rng);
            print("</td>", .{});
        } else print("<td></td>\n", .{});

        if (hef_val >= 0) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});
            process_HEF(flag1, hef_val, hef_rng, flag2);
            if (hef2_val >= 0)
                process_HEF2(hef2_val, hef2_rng);
            print("</td>", .{});
        } else print("<td></td>\n", .{});

        if (mf_val >= 0) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});
            process_MF(mf_val, flag2, flag3);
            if ((flag1 & (3 << 13)) > 0)
                if ((flag1 & (3 << 13)) == (1 << 13))
                    print("May carry leg units.<br>", .{})
                else
                    print("May only carry Recon leg unit.<br>", .{});
            if ((flag1 & (1 << 15)) > 0)
                print("Passengers may fire.<br>", .{});
            if ((flag1 & (3 << 11)) > 0)
                if ((flag1 & (3 << 11)) == (1 << 11))
                    print("May move & fire. 1-column shift.<br>", .{})
                else
                    print("May move & fire. 2-column shift.<br>", .{});
            print("</td>", .{});
        } else print("<td></td>\n", .{});

        if (caf_val >= 0) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});

            if ((flag2 & (1 << 1)) > 0) {
                print("<b>CAF:</b> +{d}<br>", .{caf_val});
            } else {
                print("<b>CAF:</b> {d}<br>", .{caf_val});
                if ((flag2 & (1 << 2)) > 0)
                    print("May only assault within it's own hex.<br>", .{});
                if ((flag2 & (1 << 3)) > 0)
                    print("May not initiate a close assault.<br>", .{});
            }

            print("</td>", .{});
        } else print("<td></td>\n", .{});

        if (armor_val > -100) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});

            if ((flag3 & (1 << 8)) > 0) {
                print("<b>Armor:</b> +{d}", .{armor_val});
            } else {
                print("<b>Armor:</b> {d}", .{armor_val});
                if (armor_val >= 0) {
                    if ((flag2 & (3 << 4)) > 0)
                        if ((flag2 & (1 << 4)) > 0)
                            print("<sup>-1</sup><br>", .{})
                        else
                            print("<sup>+1</sup><br>", .{});
                }
                if ((flag2 & (1 << 6)) > 0) print("<br>Unarmored vehicle.<br>", .{});
            }

            print("</td>", .{});
        } else print("<td></td>\n", .{});

        // ***********************************************************************************
        if (flag3 > 0) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});
            if ((flag3 & (1 << 0)) > 0) {
                print("<b>Commander</b><br>", .{});
            }
            if ((flag3 & (1 << 1)) > 0) {
                print("<b>Hero</b><br>", .{});
            }
            if ((flag3 & (1 << 2)) > 0) {
                print("<b>Champion</b><br>", .{});
            }
            print("</td>", .{});
        } else print("<td></td>\n", .{});

        print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});

        if ((flag2 & (1 << 10)) > 0) print("<b>Lycan</b><br>", .{});
        if ((flag2 & (1 << 11)) > 0) print("<b>Vampire</b><br>", .{});
        if ((flag2 & (1 << 12)) > 0) print("<b>Zombie</b><br>", .{});
        if ((flag2 & (1 << 14)) > 0) print("<b>Aircraft</b><br>", .{});

        if ((ability2 & (1 << 7)) > 0) print("Acid Bile; ", .{});
        if ((ability1 & (1 << 0)) > 0) print("Activate Twice; ", .{});
        if ((flag2 & (1 << 9)) > 0) print("Advance Targeting; ", .{});
        if ((ability1 & (1 << 1)) > 0) print("Aggressive; ", .{});
        if ((ability2 & (1 << 9)) > 0) print("Anti-Aircraft; ", .{});
        if ((ability2 & (1 << 8)) > 0) print("Blood Thirsty; ", .{});
        if ((ability2 & (1 << 10)) > 0) print("Boom Risk; ", .{});
        if ((ability1 & (1 << 2)) > 0) print("Brutal; ", .{});
        if ((ability1 & (1 << 3)) > 0) print("Concealed; ", .{});
        if ((ability1 & (1 << 4)) > 0) print("Courageous; ", .{});
        if ((ability2 & (1 << 11)) > 0) print("Deathless; ", .{});
        if ((ability2 & (1 << 12)) > 0) print("Ethereal Being; ", .{});
        if ((ability2 & (1 << 13)) > 0) print("Eye of Chaos; ", .{});
        if ((ability2 & (1 << 6)) > 0) print("Explosive Decomposition; ", .{});
        if ((ability1 & (1 << 5)) > 0) print("Fearsome Howl; ", .{});
        if ((ability1 & (1 << 6)) > 0) print("Fireball; ", .{});
        if ((ability2 & (1 << 5)) > 0) print("Fly; ", .{});
        if ((ability1 & (1 << 7)) > 0) print("Frenzied; ", .{});
        if ((ability2 & (1 << 14)) > 0) print("Gateway to the Abyss; ", .{});
        if ((ability2 & (1 << 15)) > 0) print("Ghost Buster; ", .{});
        if ((ability3 & (1 << 9)) > 0) print("Ghost Buster (adjacent); ", .{});
        if ((ability3 & (1 << 0)) > 0) print("Healer; ", .{});
        if ((ability3 & (1 << 1)) > 0) print("Iron Resolve; ", .{});
        if ((ability1 & (1 << 8)) > 0) print("Leap; ", .{});
        if ((ability1 & (1 << 9)) > 0) print("Lightning Strike; ", .{});
        if ((ability2 & (1 << 2)) > 0) print("Lucky; ", .{});
        if ((ability3 & (1 << 2)) > 0) print("Necrotic Plague; ", .{});
        if ((ability3 & (1 << 3)) > 0) print("Psychic; ", .{});
        if ((ability2 & (1 << 3)) > 0) print("Rally; ", .{});
        if ((ability1 & (1 << 10)) > 0) print("Reanimate; ", .{});
        if ((flag2 & (1 << 8)) > 0) print("Recon; ", .{});
        if ((ability1 & (1 << 11)) > 0) print("ReconB; ", .{});
        if ((ability2 & (1 << 4)) > 0) print("Regenerate; ", .{});
        if ((ability3 & (1 << 4)) > 0) print("Ripplefire; ", .{});
        if ((ability1 & (1 << 12)) > 0) print("Silver Bullet; ", .{});
        if ((ability1 & (1 << 13)) > 0) print("Sniper; ", .{});
        if ((ability3 & (1 << 5)) > 0) print("Spirit Control; ", .{});
        if ((ability1 & (1 << 14)) > 0) print("Steady; ", .{});
        if ((ability3 & (1 << 6)) > 0) print("Suicidal; ", .{});
        if ((ability3 & (1 << 7)) > 0) print("Tornadic Impact; ", .{});
        if ((ability1 & (1 << 15)) > 0) print("Tough; ", .{});
        if ((ability2 & (1 << 0)) > 0) print("Veteran; ", .{});
        if ((ability2 & (1 << 1)) > 0) print("Wolf Speed; ", .{});
        if ((ability3 & (1 << 8)) > 0) print("Wooden Missiles; ", .{});

        print("</td>", .{});

        print("</tr>\n", .{});
    }
}

fn process_MF(mf_val: i64, flag2: i64, flag3: i64) void {
    print("<b>MF:</b> {d} (", .{mf_val});
    if ((flag2 & (1 << 15)) > 0) print("Leg)<br>", .{});
    if ((flag3 & (1 << 3)) > 0) print("Track)<br>", .{});
    if ((flag3 & (1 << 4)) > 0) print("Wheel)<br>", .{});
    if ((flag3 & (1 << 5)) > 0) print("Mecha)<br>", .{});
    if ((flag2 & (1 << 13)) > 0) print("VTOL)<br>", .{});
}

fn process_HEF2(hef2_val: i64, hef2_rng: [*c]const u8) void {
    print("<b>HEF2:</b> {d}", .{hef2_val});
    print(" ({s})<br>", .{hef2_rng});
}

fn process_HEF(flag1: i64, hef_val: i64, hef_rng: [*c]const u8, flag2: i64) void {
    if ((flag2 & (1 << 0)) > 0) {
        print("<b>HEF:</b> +{d}", .{hef_val});
    } else {
        print("<b>HEF:</b> {d}", .{hef_val});
        if ((flag1 & (3 << 6)) > 0) {
            if ((flag1 & (1 << 6)) > 0)
                print("<sup>-1</sup>", .{})
            else
                print("<sup>+1</sup>", .{});
        }
        print(" ({s})<br>", .{hef_rng});
        if ((flag1 & (1 << 8)) > 0) {
            print("May damage Armor <= 4.<br>", .{});
        }
        if ((flag1 & (1 << 9)) > 0) {
            print("Minimum range of 2.<br>", .{});
        }
        if ((flag1 & (1 << 10)) > 0) {
            print("Range effects do not apply.<br>", .{});
        }
    }
}

fn process_APF2(apf2_val: i64, apf2_rng: [*c]const u8) void {
    print("<b>APF2:</b> {d}", .{apf2_val});
    print(" ({s})<br>", .{apf2_rng});
}

fn process_APF(flag1: i64, apf_val: i64, apf_rng: [*c]const u8) void {
    print("<b>APF:</b> {d}", .{apf_val});
    if ((flag1 & (3 << 3)) > 0) {
        if ((flag1 & (1 << 3)) > 0)
            print("<sup>-1</sup>", .{})
        else
            print("<sup>+1</sup>", .{});
    }
    print(" ({s})<br>", .{apf_rng});
    // *********************************
    if ((flag1 & (1 << 2)) > 0)
        print("Wired guided missiles.<br>", .{});
    if ((flag1 & (1 << 5)) > 0)
        print("Range effects do not apply.<br>", .{});
}
