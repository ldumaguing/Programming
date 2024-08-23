use rusqlite::{Connection, Result};

#[derive(Debug)]
struct Species {
    id: i32,
    name: String,
    descript: String,
}

// ***************************************************************************************
fn main() -> Result<()> {
    let conn = Connection::open("../wretched.db")?;
    let mut stmt = conn.prepare("SELECT id, name, descript FROM species")?;

    boiler_plate_1();

    let species_iter = stmt.query_map([], |row| {
        Ok(Species {
            id: row.get(0)?,
            name: row.get(1)?,
            descript: row.get(2)?,
        })
    })?;

    for x in species_iter {
        let y = x.unwrap();
        println!("<b><h1>{}</h1></b><p>{}", y.name, y.descript);
        println!("<p>");
    }

    boiler_plate_2();

    Ok(())
}

// ***************************************************************************************
fn boiler_plate_1() {
    println!("<!DOCTYPE html>");
    println!("<html lang=\"en\">");
    println!("<head>");
    println!("<meta charset=\"UTF-8\">");
    println!("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
    println!("<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">");
    println!("<title>Wretched RPG</title>");
    println!("<link rel=\"stylesheet\" href=\"style.css\">");
    println!("</head>");
    println!("<body>");
    println!("<script src=\"index.js\"></script>");
}

fn boiler_plate_2() {
    println!("</body>");
    println!("</html>");
}
