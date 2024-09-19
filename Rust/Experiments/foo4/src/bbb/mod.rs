use crate::Hexagon;

pub struct Unit {
    pub id: i64,
}

impl Unit {
    pub fn foo(&self) {
        println!("in unit-foo");
        let hex0 = Hexagon { id: (4, 5) };
        hex0.foo();
    }
}
