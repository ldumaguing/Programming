const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const tile = @import("Tile.zig");
const terrain = @import("Terrain.zig");

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub const Database = struct {
    db: ?*c.sqlite3, // in-memory Database
    currSession: i64,
    pixelCount: [2]i32,

    // ********************************************************************************************
    pub fn init() Database {
        var dsk_db: ?*c.sqlite3 = null;
        var db: ?*c.sqlite3 = null;

        // Open the databases
        if (c.sqlite3_open("DB/TLR.db", &dsk_db) != c.SQLITE_OK) {
            print("Error opening database\n", .{});
        }
        defer _ = c.sqlite3_close(dsk_db); // close disk connection after init.

        if (c.sqlite3_open(":memory:", &db) != c.SQLITE_OK) {
            print("Error opening database\n", .{});
        }

        // Initialize
        const p_backup = c.sqlite3_backup_init(db, "main", dsk_db, "main");
        defer _ = c.sqlite3_backup_finish(p_backup);

        // Copy database pages iteratively
        var rc: c_int = c.SQLITE_OK;
        while (rc == c.SQLITE_OK or rc == c.SQLITE_BUSY or rc == c.SQLITE_LOCKED) {
            rc = c.sqlite3_backup_step(p_backup, -1); // -1 copies all remaining pages at once
        }

        // Prepare the SQL statement
        var stmt: ?*c.sqlite3_stmt = null;
        const sql = "SELECT val_int0 FROM GameMeta WHERE attrib = 'currSession'";
        _ = c.sqlite3_prepare_v2(dsk_db, sql, -1, &stmt, null);
        defer _ = c.sqlite3_finalize(stmt);

        // Evaluate the statement
        var currSession: i64 = 0;
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            currSession = c.sqlite3_column_int64(stmt, 0);
        }

        // Prepare the SQL statement
        const sql_1 = "SELECT val_int0, val_int1 FROM GameMeta WHERE attrib = 'pixelCount'";
        _ = c.sqlite3_prepare_v2(dsk_db, sql_1, -1, &stmt, null);

        // Evaluate the statement
        var i64_X: i64 = 0;
        var i64_Y: i64 = 0;
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            i64_X = c.sqlite3_column_int64(stmt, 0);
            i64_Y = c.sqlite3_column_int64(stmt, 1);
        }

        // ======================================================
        return Database{
            .db = db,
            .currSession = currSession,
            .pixelCount = .{ @intCast(i64_X), @intCast(i64_Y) },
        };
    }

    // ********************************************************************************************
    pub fn add_map_hills(self: Database, allocator: std.mem.Allocator, hills: *std.ArrayList(terrain.Hill)) !void {
        // Prepare the SQL statement
        var stmt: ?*c.sqlite3_stmt = null;
        const sql =
            \\SELECT hex_x, hex_y, hex_z FROM GameMap
            \\WHERE
            \\terrainNum = 5 AND
            \\sessionID = ?1
        ;
        _ = c.sqlite3_prepare_v2(self.db, sql, -1, &stmt, null);
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 1, curS);

        // Evaluate the statement
        while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            const hex_x = c.sqlite3_column_int(stmt, 0);
            const hex_y = c.sqlite3_column_int(stmt, 1);
            const hex_z = c.sqlite3_column_int(stmt, 2);

            const aHill = terrain.Hill.init(hex_x, hex_y, hex_z);
            _ = try hills.append(allocator, aHill);
        }
    }

    // ********************************************************************************************
    pub fn add_map_tiles(self: Database, allocator: std.mem.Allocator, textures: *std.ArrayList(rl.Texture), tiles: *std.ArrayList(tile.Tile)) !void {
        // Prepare the SQL statement
        var stmt: ?*c.sqlite3_stmt = null;
        const sql =
            \\SELECT val_text FROM GameMeta
            \\WHERE
            \\attrib = 'tiles' AND
            \\sessionID = ?1
        ;
        _ = c.sqlite3_prepare_v2(self.db, sql, -1, &stmt, null);
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 1, curS);

        // Evaluate the statement
        if (c.sqlite3_step(stmt) != c.SQLITE_ROW) return;

        const raw_str = c.sqlite3_column_text(stmt, 0);
        const tileLetters: []const u8 = std.mem.span(raw_str);

        // ======================================
        if (std.mem.containsAtLeast(u8, tileLetters, 1, "A") or std.mem.containsAtLeast(u8, tileLetters, 1, "a")) {
            // add image to asset collection
            const index = textures.items.len;
            try textures.append(allocator, try rl.loadTexture("TLR/Map A.png"));

            // add tiles
            if (std.mem.containsAtLeast(u8, tileLetters, 1, "A")) {
                const tl = tile.Tile.init(index, 0, 0.0);
                _ = try tiles.append(allocator, tl);
            }

            if (std.mem.containsAtLeast(u8, tileLetters, 1, "a")) {
                const tl = tile.Tile.init(index, 0, 180.0);
                _ = try tiles.append(allocator, tl);
            }
        }
        if (std.mem.containsAtLeast(u8, tileLetters, 1, "B") or std.mem.containsAtLeast(u8, tileLetters, 1, "b")) {
            // add image to asset collection
            const index = textures.items.len;
            try textures.append(allocator, try rl.loadTexture("TLR/Map B.png"));

            // add tiles
            if (std.mem.containsAtLeast(u8, tileLetters, 1, "B")) {
                const tl = tile.Tile.init(index, 1, 0.0);
                _ = try tiles.append(allocator, tl);
            }

            if (std.mem.containsAtLeast(u8, tileLetters, 1, "b")) {
                const tl = tile.Tile.init(index, 1, 180.0);
                _ = try tiles.append(allocator, tl);
            }
        }
        if (std.mem.containsAtLeast(u8, tileLetters, 1, "C") or std.mem.containsAtLeast(u8, tileLetters, 1, "c")) {
            // add image to asset collection
            const index = textures.items.len;
            try textures.append(allocator, try rl.loadTexture("TLR/Map C.png"));

            // add tiles
            if (std.mem.containsAtLeast(u8, tileLetters, 1, "C")) {
                const tl = tile.Tile.init(index, 2, 0.0);
                _ = try tiles.append(allocator, tl);
            }

            if (std.mem.containsAtLeast(u8, tileLetters, 1, "c")) {
                const tl = tile.Tile.init(index, 2, 180.0);
                _ = try tiles.append(allocator, tl);
            }
        }
        if (std.mem.containsAtLeast(u8, tileLetters, 1, "D") or std.mem.containsAtLeast(u8, tileLetters, 1, "d")) {
            // add image to asset collection
            const index = textures.items.len;
            try textures.append(allocator, try rl.loadTexture("TLR/Map D.png"));

            // add tiles
            if (std.mem.containsAtLeast(u8, tileLetters, 1, "D")) {
                const tl = tile.Tile.init(index, 3, 0.0);
                _ = try tiles.append(allocator, tl);
            }

            if (std.mem.containsAtLeast(u8, tileLetters, 1, "d")) {
                const tl = tile.Tile.init(index, 3, 180.0);
                _ = try tiles.append(allocator, tl);
            }
        }
        if (std.mem.containsAtLeast(u8, tileLetters, 1, "E") or std.mem.containsAtLeast(u8, tileLetters, 1, "e")) {
            // add image to asset collection
            const index = textures.items.len;
            try textures.append(allocator, try rl.loadTexture("TLR/Map E.png"));

            // add tiles
            if (std.mem.containsAtLeast(u8, tileLetters, 1, "E")) {
                const tl = tile.Tile.init(index, 4, 0.0);
                _ = try tiles.append(allocator, tl);
            }

            if (std.mem.containsAtLeast(u8, tileLetters, 1, "e")) {
                const tl = tile.Tile.init(index, 4, 180.0);
                _ = try tiles.append(allocator, tl);
            }
        }
    }

    // ********************************************************************************************
    pub fn get_tileLetters(self: Database, allocator: std.mem.Allocator) ![]u8 {
        // Prepare the SQL statement
        var stmt: ?*c.sqlite3_stmt = null;
        const sql =
            \\SELECT val_text FROM GameMeta
            \\WHERE
            \\attrib = 'tiles' AND
            \\sessionID = ?1
        ;
        _ = c.sqlite3_prepare_v2(self.db, sql, -1, &stmt, null);
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 1, curS);

        // Evaluate the statement
        if (c.sqlite3_step(stmt) != c.SQLITE_ROW) return undefined;

        const raw_str = c.sqlite3_column_text(stmt, 0);

        return try std.fmt.allocPrint(allocator, "{s}", .{raw_str});
    }

    // ********************************************************************************************
    pub fn get_float_vals(self: Database, attrib: []const u8) struct { f32, f32, f32 } {
        // Prepare statement
        const query1 =
            \\SELECT val_real0, val_real1, val_real2 FROM GameMeta
            \\WHERE
            \\   attrib = ?1
            \\   AND
            \\   sessionID = 0
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(self.db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(self.db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        _ = c.sqlite3_bind_text(stmt, 1, attrib.ptr, @intCast(attrib.len), c.SQLITE_TRANSIENT);
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 2, curS);

        // Evaluate the statement
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            const x: f32 = @floatCast(c.sqlite3_column_double(stmt, 0));
            const y: f32 = @floatCast(c.sqlite3_column_double(stmt, 1));
            const z: f32 = @floatCast(c.sqlite3_column_double(stmt, 2));
            return .{ x, y, z };
        }

        return .{ 0.0, 0.0, 0.0 };
    }

    // ********************************************************************************************
    pub fn foo(self: Database) void {
        print("{d}\n", .{self.currSession});
        print("{d},{d}\n", .{ self.pixelCount[0], self.pixelCount[1] });
    }

    // ********************************************************************************************
    pub fn close(self: Database) void {
        _ = c.sqlite3_close(self.db);
    }
};
