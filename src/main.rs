use actix_web::{get, App, HttpServer, HttpResponse};

#[get("/")]
async fn hello() -> HttpResponse {
    HttpResponse::Ok().body("Hello world")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().service(hello))
        .workers(2)
        .bind(("0.0.0.0", 4242))?
        .run()
        .await
}