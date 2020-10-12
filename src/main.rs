extern crate unisoul;
extern crate diesel;

use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};
use self::models::*;
use diesel::prelude::*;
use unisoul::*;
use unisoul::schema::*;


// #[get("/")]
// async fn hello() -> impl Responder {
//     HttpResponse::Ok().body("Hello world!")
// }

// #[post("/echo")]
// async fn echo(req_body: String) -> impl Responder {
//     HttpResponse::Ok().body(req_body)
// }

// async fn manual_hello(data: web::Data<PgConnection>) -> impl Responder {
//     HttpResponse::Ok().body("Hey there!")
// }


// fn main(){
//         let connection = establish_conneciton();
//         let results = table_user::table.load::<User>(&connection).expect("Error loading posts");
    
//         println!("Displaying {} posts", results.len());
//         for post in results {
//             println!("{}", post.user_id);
//             println!("{}", post.first_name);
//         }
    
//         //entity framework
//         let users = diesel::sql_query("Select * from f_get_university()").load::<UniversityDisplay>(&connection);
//         println!("{:?}", users);
//         //  println!("{:?}", users); 
// }
// #[actix_web::main]
// async fn main()-> std::io::Result<()> {
//     let connection = establish_conneciton();
//     let results = table_user::table.load::<User>(&connection).expect("Error loading posts");

//     println!("Displaying {} posts", results.len());
//     for post in results {
//         println!("{}", post.user_id);
//         println!("{}", post.first_name);
//     }

//     //entity framework
//     let users = diesel::sql_query("Select * from f_get_university()").load::<UniversityDisplay>(&connection);
//     println!("{:?}", users);
//     //  println!("{:?}", users); 

//     //      HttpServer::new(|| {
//     //     App::new()
//     //         .data(connection)
//     //         .service(hello)
//     //         .service(echo)
//     //         .route("/hey", web::get().to(manual_hello))
//     // })
//     // // .bind("127.0.0.1:8080")?
//     // .run()
//     // .await
//     // let users = diesel::sql_query("select * from table_university where table_university.active='Y'").load::<University>(&connection);
//     // let users = diesel::sql_query("select * from table_university where table_university.active='Y'").load::<University>(&connection);
//     // select * from public.f_get_university(null, null, 'Y')
//     // println!("{:?}", users); 
//     // for post2 in users {
//     //     println!("Displaying {} posts", post2.len());
//     //     for post3 in post2 {
//     //         println!("{}", post3.university_id);
//     //         println!("----------\n");
//     //         println!("{}", post3.university_name);
//     //     }
//     // }
// }
    
#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello world!")
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().body(req_body)
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().body("Hey there!")
}


#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(echo)
            .route("/hey", web::get().to(manual_hello))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}