pub enum Direction {
    N,
    S,
    NW,
    NE,
    SW,
    SE,
}

pub struct HexID(pub i32, pub i32);
pub struct HexLoc(pub f32, pub f32);

pub fn get_HexID() -> HexID {
    let x: HexID = HexID(5,6);
    x
}

pub fn get_HexID2(fish: HexID) -> HexID {
    let x: HexID = HexID(fish.0*10,fish.1*10);
    x
}






pub fn hex_hello() {
    println!("yo");
}

pub fn hex_get_adjacent((x, y): (u8, u8), d: char) {
    println!(">>> ({x}, {y}), {d}");
    let z: f32 = 45.0;

    println!("{}, {}", z.sin(), z.cos());
}
