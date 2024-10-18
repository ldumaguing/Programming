#[derive(Debug)]
enum List {
    Cons(i32, Box<List>),
    Nil,
}

use crate::List::{Cons, Nil};

fn main() {
    let list: List = Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil))))));
    println!("{:?}", list);
    let list2: List = Nil;
    println!("{:?}", list2);
    let list3: List = Cons(4, Box::new(Nil));
    println!("{:?}", list3);
}

/* ***********************************************************************
use std::ops::Deref;

struct MyBox<T>(T);

impl<T> MyBox<T> {
    fn new(x: T) -> MyBox<T> {
        MyBox(x)
    }
}

impl<T> Deref for MyBox<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

fn main() {
    let x = 5;
    let y = MyBox::new(x);

    assert_eq!(5, x);
    assert_eq!(5, *y);
}
*/

/* ***********************************************************************
fn main() {
    let x = 5;
    let y = Box::new(x);

    assert_eq!(5, x);
    assert_eq!(5, *y);
}
*/

/* ***********************************************************************
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
*/
