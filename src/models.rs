use std::option;
use chrono::prelude::*;
use crate::schema::*;
use diesel::sql_types::{BigInt, Text};
use diesel::sql_types::Nullable;

    #[derive(Debug,Queryable,QueryableByName)]
    #[table_name="table_area"]
    pub struct Area {
        pub area_id : i64,
        pub area_name : String,
        pub state_id : i64,
        pub active : Option<String>,
        pub created_by : Option<i64>,
        pub creation_date : Option<NaiveDate>,
        pub last_updated_by : Option<i64>,
        pub last_update_date : Option<NaiveDate>,
    }

    #[derive(Debug,Queryable,QueryableByName)]
    #[table_name="table_country"]
    pub struct Country {
        pub country_id : i64,
        pub country_name : String,
        pub active : Option<String>,
        pub created_by : Option<i64>,
        pub creation_date : Option<NaiveDate>,
        pub last_updated_by : Option<i64>,
        pub last_update_date : Option<NaiveDate>,
    }

    #[derive(Debug,Queryable,QueryableByName)]
    #[table_name="table_role"]
    pub struct Role {
        pub role_id : i64,
        pub role_name : String,
        pub role_description : Option<String>,
        pub active : String,
        pub created_by : Option<i32>,
        pub creation_date : Option<NaiveDate>,
        pub last_updated_by : Option<i32>,
        pub last_update_date : Option<NaiveDate>,
    }

    #[derive(Debug,Queryable,QueryableByName)]
    #[table_name="table_state"]
    pub struct State {
        pub state_id : i64,
        pub state_name : String,
        pub country_id : i64,
        pub active : Option<String>,
        pub created_by : Option<i64>,
        pub creation_date : Option<NaiveDate>,
        pub last_updated_by : Option<i64>,
        pub last_update_date : Option<NaiveDate>,
    }

    #[derive(Debug,Queryable,QueryableByName)]
    #[table_name="table_university"]
    pub struct University {
        pub university_id : i64,
        pub university_name : String,
        pub area_id : Option<i64>,
        pub email_prefix : String,
        pub active : String,
        pub created_by : Option<i64>,
        pub creation_date : Option<NaiveDate>,
        pub last_updated_by : Option<i64>,
        pub last_update_date : Option<NaiveDate>,
    }

    #[derive(Debug,Queryable,QueryableByName)]
    #[table_name="table_user"]
    pub struct User{
        pub user_id: i64,
        pub gender: String,
        pub first_name: String,
        pub last_name: String,
        pub email_address: String,
        pub mobile_number: Option<String>,
        pub role_id : i64,
        pub date_of_birth: Option<NaiveDate>,
        pub password : String,
        pub activated_flag : String,
        pub race_country_id: i64,
        pub profile_picture_url: Option<String>,
    }


    #[derive(Debug,Queryable,QueryableByName)]
    pub struct UniversityDisplay {
        #[sql_type="BigInt"]
        pub university_id : i64,
        #[sql_type="Text"]
        pub university_name : String,
        #[sql_type="Nullable<BigInt>"]
        pub area_id : Option<i64>,
        #[sql_type="Text"]
        pub area_name: String,
        #[sql_type="Nullable<BigInt>"]
        pub state_id : Option<i64>,
        #[sql_type="Text"]
        pub state_name: String,
        #[sql_type="Nullable<BigInt>"]
        pub country_id : Option<i64>,
        #[sql_type="Text"]
        pub country_name: String,
        #[sql_type="Text"]
        pub email_prefix : String,
        #[sql_type="Text"]
        pub active : String,
    }
