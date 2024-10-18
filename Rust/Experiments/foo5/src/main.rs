fn main() {
    println!("Hello, world!");
    bar(foo);
    bar1(foo1);
    bar2(foo2, 6);
    println!("");
    bar(|| println!("closure"));
    bar1(|| -> i64 { 1414 });
    bar2(|x: i64| -> i64 { 1414 + x }, 10);
    println!("");
    bar3(|x: i64, y: i64| -> i64 { x + y }, 10, 20);
}

// **************************************************
fn bar3(f: fn(i64, i64) -> i64, x: i64, y: i64) {
    println!("bar3 {}: {},{}", f(x, y), x, y);
}

fn bar(x: fn()) {
    x();
}

fn bar1(x: fn() -> i64) {
    println!("bar1: {}", x());
}

fn bar2(x: fn(i64) -> i64, y: i64) {
    println!("bar2 {}: {}", x(y), y);
}

// *************************
fn foo() {
    println!("foo");
}

fn foo1() -> i64 {
    1313
}

fn foo2(x: i64) -> i64 {
    1313 + x
}
