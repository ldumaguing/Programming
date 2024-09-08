trait Vehicle {
    fn drive(&self);
}

struct Truck;

impl Vehicle for Truck {
    fn drive(&self) {
        println!("Truck is driving");
    }
}

fn main() {
    let t: Box<Vehicle>; // seems this defines a pointer
    t = Box::new(Truck); // this assigns the pointer to point to a heap
    t.drive();
}
