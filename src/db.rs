
use crate::error_handler::CustomError;
use diesel::pg::PgConnection;
use diesel::r2d2::ConnectionManager;
use lazy_static::lazy_static;
use r2d2;
use std::env;

type Pool = r2d2::Pool<ConnectionManager<PgConnection>>;
pub type DbConnection = r2d2::PooledConnection<ConnectionManager<PgConnection>>;

//embed_migration!(); //enable here if want call migration each time

//create a static Pool connection to allow web service to get the pooled connection
//currently only single connection, in future it should be multiple instance
lazy_static! {
    static ref POOL: Pool = {
        let db_url = env::var("DATABASE_URL").expect("Database url not set");
        let manager = ConnectionManager::<PgConnection>::new(db_url);
        Pool::new(manager).expect("Failed to create db pool")
    };
}

//initialize a POOL static variable of a Conneciton Pool
pub fn init(){
    lazy_static::initialize(&POOL);
    let conn = connection().expect("Failed to get db connection");
    //embedded_migration::run(&conn).unwrap(); //run migration here when init
}

//get connection of current Pool
pub fn connection()->Result<DbConnection,CustomError> {
    POOL.get()
    .map_err(|e| CustomError::new(500, format!("Failed getting db connection: {}",e)))
}



pub fn connection2()->Result<DbConnection, diesel::r2d2::PoolError> {
    POOL.get()
}
//Original Simple implementation of create a local pgconnection
// pub fn establish_conneciton()-> PgConnection{
//     dotenv().ok();

//     let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
//     PgConnection::establish(&database_url).expect(&format!("Error Connecting to {}", database_url))
// }

