use crate::Direction;
use crate::Hexagon;

pub struct Unit {
    pub id: i64,
    pub facing: Direction,
    pub hex_location: Hexagon,
}

impl Unit {
    pub fn foo(&self) {
        println!("in unit-foo");
        // let hex0 = Hexagon { id: (4, 5) };
        // hex0.foo();
    }
}
