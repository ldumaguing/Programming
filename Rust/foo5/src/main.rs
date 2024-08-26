fn main() {
    println!("Hello, world!");
    bar(foo);
    bar1(foo1);
    bar2(foo2, 6);
    println!("");
    bar(|| println!("closure"));
    bar1(|| -> i64 { 1313 });
    let x: i64 = 3;
    bar2(|foo2(x)| { println!("{}", x + 1313) }, 6);
}

fn bar(x: fn()) {
    x();
}

fn bar1(x: fn() -> i64) {
    println!("foo1: {}", x());
}

fn bar2(x: fn(i64) -> i64, y: i64) {
    println!("{}: {}", foo2(y), y);
}

fn foo() {
    println!("foo");
}

fn foo1() -> i64 {
    1313
}

fn foo2(x: i64) -> i64 {
    1313 + x
}
