#[rocket::launch]
fn rocket() -> _ {
     rocket::build().mount("/api/hello", rocket::routes![hello])
}

#[rocket::get("/")]
fn hello() -> &'static str {
    "Hello, world! (from Rocket.rs)"
}
