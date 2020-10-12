use crate::database::{UniversityDisplay,User};
use crate::error_handler::CustomError;
use actix_web::{ get, web,HttpResponse};
use serde_json::json;


#[get("/findactiveuniversity")]
async fn find_active_university()-> Result<HttpResponse,CustomError>{
    let active_university = UniversityDisplay::find_all_active_uni()?;
    Ok(HttpResponse::Ok().json(active_university))
}


#[get("/getalluser")]
async fn find_all_user()-> Result<HttpResponse,CustomError>{
    let all_user = User::find_all_users()?;
    Ok(HttpResponse::Ok().json(all_user))
}

pub fn init_routes(config: &mut web::ServiceConfig) {
    config.service(find_active_university);
    config.service(find_all_user);
}