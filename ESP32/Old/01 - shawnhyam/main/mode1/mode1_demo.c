// *********************************************************************************  mode1_demo.cpp
uint16_t palette0[8] = {  // .db $0f, $29, $1a, $0f
    0x0000,
    SWAP_BYTES(0x7600),  //CC23
    SWAP_BYTES(0x03C0),  // 52C0
    SWAP_BYTES(0x0000),
    0x0000,
    0x0000,
    0x0000,
    0x0000
};

/*
 $0CDB 0F 29 1A 0F - Pipes
 $0CDF 0F 36 17 0F - Blocks
 $0CE3 0F 30 21 0F - Sky
 $0CE7 0F 27 17 0F - ?block (The actual pallete for color 1 is elsewhere)
 */


// ground
static uint16_t palette1[8] = {  // .db $0f, $36, $17, $0f
    0x0000,
    SWAP_BYTES(0xE595),
    SWAP_BYTES(0x71C0),
    SWAP_BYTES(0x0000),
    0x0000,
    0x0000,
    0x0000,
    0x0000
};

uint16_t palette2[8] = {  // .db $0f, $30, $21, $0f
    0x0000,
    SWAP_BYTES(0xFFFF),
    SWAP_BYTES(0x4CDC),
    SWAP_BYTES(0x0000),
    0x0000,
    0x0000,
    0x0000,
    0x0000
};

uint16_t palette3[8] = {  // .db $0f, $27, $17, $0f
    0x0000,
    SWAP_BYTES(0xCC23),
    SWAP_BYTES(0x71C0),
    SWAP_BYTES(0x0000),
    0x0000,
    0x0000,
    0x0000,
    0x0000
};


/*
 .db $1e, $c2, $00, $6b, $06, $8b, $86, $63, $b7, $0f, $05
 .db $03, $06, $23, $06, $4b, $b7, $bb, $00, $5b, $b7
 .db $fb, $37, $3b, $b7, $0f, $0b, $1b, $37
 .db $ff
 */
uint8_t level_data[29] = {
    0x1e, 0xc2, 0x00, 0x6b, 0x8b, 0x86, 0x63, 0xb7, 0x0f, 0x05,
    0x03, 0x06, 0x23, 0x06, 0x4b, 0xb7, 0xbb, 0x00, 0x5b, 0xb7,
    0xfb, 0x37, 0x3b, 0xb7, 0x0f, 0x0b, 0x1b, 0x37,
    0xff
};

// 0x1e 0xc2
// time = 0b00
// auto walk = 0b0
// starting position = 0b11
// background = 0b110
// compliment = 0b11
// scenery type = 0b00
// ground/block type = 0b0010

// 0xc2 0x1e (0b11000010 00011110)
// time = 0b11
// auto walk = 0
// starting position = 00
// background = 01
// compliment =

// 00011110 11000010
// time = 01
// auto walk = 1


void place_metatile_at(int x, int y, uint8_t palette, const uint8_t tiles[4]) {
    set_tile_at(tiles[0], palette, x*2, y*2);
    set_tile_at(tiles[2], palette, x*2+1, y*2);
    set_tile_at(tiles[1], palette, x*2, y*2+1);
    set_tile_at(tiles[3], palette, x*2+1, y*2+1);

}

void place_bush_at(int x, int y, int width) {
    // .db $24, $24, $24, $35 ;bush left
    //  .db $36, $25, $37, $25 ;bush middle
    //  .db $24, $38, $24, $24 ;bush right
    place_metatile_at(x, y, 0, (const uint8_t[4]){0x24, 0x24, 0x24, 0x35});
    for (int i=0; i<width; i++) {
        place_metatile_at(x+1+i, y, 0, (const uint8_t[4]){0x36, 0x25, 0x37, 0x25});
    }
    place_metatile_at(x+width+1, y, 0, (const uint8_t[4]){0x24, 0x38, 0x24, 0x24});
}

void place_pipe_at(int x, int y, int height) {
    /*
     .db $60, $64, $61, $65 ;decoration pipe end left, points up
     .db $62, $66, $63, $67 ;decoration pipe end right, points up
     .db $68, $68, $69, $69 ;pipe shaft left
     .db $26, $26, $6a, $6a ;pipe shaft right
     */
    
    for (int i=0; i<height; i++) {
        place_metatile_at(x, y-i, 0, (const uint8_t[4]){0x68, 0x68, 0x69, 0x69});
        place_metatile_at(x+1, y-i, 0, (const uint8_t[4]){0x26, 0x26, 0x6a, 0x6a});
    }
    place_metatile_at(x, y-height, 0, (const uint8_t[4]){0x60, 0x64, 0x61, 0x65});
    place_metatile_at(x+1, y-height, 0, (const uint8_t[4]){0x62, 0x66, 0x63, 0x67});

}


// x is the center, y is the top
void place_mountaintop_at(int x, int y) {
    /*
    .db $24, $30, $30, $26 ;mountain left
     .db $26, $26, $34, $26 ;mountain left bottom/middle center
     .db $24, $31, $24, $32 ;mountain middle top
     .db $33, $26, $24, $33 ;mountain right
     */
    place_metatile_at(x, y, 0, (const uint8_t[4]){0x24, 0x31, 0x24, 0x32});
    place_metatile_at(x, y+1, 0, (const uint8_t[4]){0x26, 0x26, 0x34, 0x26});
    place_metatile_at(x-1, y+1, 0, (const uint8_t[4]){0x24, 0x30, 0x30, 0x26});
    place_metatile_at(x+1, y+1, 0, (const uint8_t[4]){0x33, 0x26, 0x24, 0x33});
}

// x is the center, y is the top of the mountain (matches y above)
void place_mountainbase_at(int x, int y) {
    // mountain left metatile (0x05)
    place_metatile_at(x-2, y+2, 0, (const uint8_t[4]){0x24, 0x30, 0x30, 0x26});
    // mountain right
    place_metatile_at(x+2, y+2, 0, (const uint8_t[4]){0x33, 0x26, 0x24, 0x33});
    // 0x06   .db $26, $26, $34, $26 ;mountain left bottom/middle center
    place_metatile_at(x-1, y+2, 0, (const uint8_t[4]){0x26, 0x26, 0x34, 0x26});
    //  .db $34, $26, $26, $26 ;mountain right bottom
    place_metatile_at(x+1, y+2, 0, (const uint8_t[4]){0x34, 0x26, 0x26, 0x26});
    // .db $26, $26, $26, $26 ;mountain middle bottom
    place_metatile_at(x, y+2, 0, (const uint8_t[4]){0x26, 0x26, 0x26, 0x26});
}
    


void place_brick_at(int x, int y) {
    //   .db $45, $47, $45, $47 ;breakable brick w/ line
    place_metatile_at(x, y, 1, (const uint8_t[4]){0x45, 0x47, 0x45, 0x47});

}

void place_question_at(int x, int y, int power_up) {
//   .db $53, $55, $54, $56 ;question block (coin)
// .db $53, $55, $54, $56 ;question block (power-up)
    place_metatile_at(x, y, 3, (const uint8_t[4]){0x53, 0x55, 0x54, 0x56});
}

void place_cloud_at(int x, int y, int width) {
    //   .db $24, $24, $24, $35 ;cloud left
    place_metatile_at(x, y, 2, (const uint8_t[4]){0x24, 0x24, 0x24, 0x35});
    
    //   .db $24, $24, $39, $24 ;cloud bottom left
    place_metatile_at(x, y+1, 2, (const uint8_t[4]){0x24, 0x24, 0x39, 0x24});

    //   .db $24, $38, $24, $24 ;cloud right
    place_metatile_at(x+width+1, y, 2, (const uint8_t[4]){0x24, 0x38, 0x24, 0x24});

    //   .db $3c, $24, $24, $24 ;cloud bottom right
    place_metatile_at(x+width+1, y+1, 2, (const uint8_t[4]){0x3c, 0x24, 0x24, 0x24});

    for (int i=0; i<width; i++) {
        // .db $36, $25, $37, $25 ;cloud middle
        place_metatile_at(x+i+1, y, 2, (const uint8_t[4]){0x36, 0x25, 0x37, 0x25});
        
        //   .db $3a, $24, $3b, $24 ;cloud bottom middle
        place_metatile_at(x+i+1, y+1, 2, (const uint8_t[4]){0x3a, 0x24, 0x3b, 0x24});
    }

}

void place_ground_at(int x, int y, int width, int height) {
    for (int v=0; v<height; v++) {
        for (int h=0; h<width; h++) {
            place_metatile_at(x+h, y+v, 1, (const uint8_t[4]){0xb4, 0xb6, 0xb5, 0xb7});
        }
    }
}


void app_main() {
    stdio_init_all();
	mode1_init();

    palette[0] = palette0;
    palette[1] = palette1;
    palette[2] = palette2;
    palette[3] = palette3;

    place_ground_at(0, 13, MAP_WIDTH/2, 2);

    place_cloud_at(8, 3, 1);
    place_cloud_at(19, 2, 1);
    place_cloud_at(27, 3, 3);
    place_cloud_at(36, 2, 2);

    place_bush_at(11, 12, 3);
    place_bush_at(23, 12, 1);

    place_pipe_at(28, 12, 1);
    place_pipe_at(38, 12, 2);

    place_brick_at(20, 9);
    place_brick_at(22, 9);
    place_brick_at(24, 9);

    place_question_at(16, 9, 0);
    place_question_at(21, 9, 1);
    place_question_at(23, 9, 0);
    place_question_at(22, 5, 0);

    place_mountaintop_at(2, 10);
    place_mountainbase_at(2, 10);

    place_mountaintop_at(17, 11);

    place_bush_at(41, 12, 2);
    place_pipe_at(46, 12, 3);
    place_mountaintop_at(50, 10);
    place_mountainbase_at(50, 10);
    place_pipe_at(57, 12, 3);

    place_bush_at(59, 12, 3);
    place_mountaintop_at(65, 11);
    place_bush_at(71, 12, 1);
    place_bush_at(89, 12, 2);
    place_mountaintop_at(98, 10);
    place_mountainbase_at(98, 10);
    place_bush_at(107, 12, 3);
    place_mountaintop_at(113, 11);
    place_bush_at(119, 12, 1);
    place_bush_at(137, 12, 2);
    place_mountaintop_at(146, 10);
    place_mountainbase_at(146, 10);
    place_bush_at(158, 12, 0);
    place_mountaintop_at(161, 11);
    place_pipe_at(163, 12, 1);
    place_bush_at(167, 12, 1);
    place_pipe_at(179, 12, 1);
    place_mountaintop_at(194, 10);
    place_mountainbase_at(194, 10);


    
    draw_background();
    
    while (1) {
        for (int i=0; i<32; i++) {
        scroll_background(1);
        sleep_ms(1);
        }
        //height_offset += 1;
        //draw_background();
    }
    

}

