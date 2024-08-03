pub fn hello() {
    println!("yo");
}

pub fn get_adjacent((x, y): (u8, u8), d: char) {
    println!(">>> ({x}, {y}), {d}");
    let z: f32 = 45.0;

    println!("{}, {}", z.sin(), z.cos());
}
