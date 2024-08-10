enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

impl Message {
    fn call(&self) {
        /*
        let fish = match self {
            Message::Quit => "1",
            Message::Move{x,y} => "2",
            Message::Write(bla) => bla,
            Message::ChangeColor(x,y,z) => "4",
        };
        println!(">>> {}", fish);
        */

        if let Message::Quit = self {
            println!(">>> I Quit");
        }
        
        if let Message::Write(bla) = self {
            println!(">>> {}", bla);
        }
    }
}

fn main() {
    let m = Message::Write(String::from("Hello, Fish."));
    m.call();   // >>> Hello, Fish.
    
    let m = Message::Quit;
    m.call();   // >>> Quit
}
