mod bar;

use bar::hello as W;
use bar::my_mod::hello as X;
use bar::my_mod2::my_mod2a::hello as Z;

fn main() {
    println!("Hello, world!");
    //bar::hello();
    //bar::my_mod::hello();
    //bar::my_mod2::my_mod2a::hello();
    W();
    X();
    Z();
}
