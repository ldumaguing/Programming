pub fn hello() {
    println!("Yo");
}

pub mod my_mod {
    pub fn hello() {
        println!("Yo2");
    }
}

pub mod my_mod2 {
    pub mod my_mod2a {
        pub fn hello() {
            println!("Yo3");
        }
    }
}
