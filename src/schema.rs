table! {
    table_area (area_id) {
        area_id -> Int8,
        area_name -> Bpchar,
        state_id -> Int8,
        active -> Nullable<Bpchar>,
        created_by -> Nullable<Int8>,
        creation_date -> Nullable<Date>,
        last_updated_by -> Nullable<Int8>,
        last_update_date -> Nullable<Date>,
    }
}

table! {
    table_country (country_id) {
        country_id -> Int8,
        country_name -> Bpchar,
        active -> Nullable<Bpchar>,
        created_by -> Nullable<Int8>,
        creation_date -> Nullable<Date>,
        last_updated_by -> Nullable<Int8>,
        last_update_date -> Nullable<Date>,
    }
}

table! {
    table_role (role_id) {
        role_id -> Int8,
        role_name -> Bpchar,
        role_description -> Nullable<Bpchar>,
        active -> Bpchar,
        created_by -> Nullable<Int8>,
        creation_date -> Nullable<Date>,
        last_updated_by -> Nullable<Int8>,
        last_update_date -> Nullable<Date>,
    }
}

table! {
    table_state (state_id) {
        state_id -> Int8,
        state_name -> Bpchar,
        country_id -> Int8,
        active -> Nullable<Bpchar>,
        created_by -> Nullable<Int8>,
        creation_date -> Nullable<Date>,
        last_updated_by -> Nullable<Int8>,
        last_update_date -> Nullable<Date>,
    }
}

table! {
    table_university (university_id) {
        university_id -> Int8,
        university_name -> Bpchar,
        area_id -> Nullable<Int8>,
        email_prefix -> Bpchar,
        active -> Bpchar,
        created_by -> Nullable<Int8>,
        creation_date -> Nullable<Date>,
        last_updated_by -> Nullable<Int8>,
        last_update_date -> Nullable<Date>,
    }
}

table! {
    table_user (user_id) {
        user_id -> Int8,
        gender -> Bpchar,
        first_name -> Bpchar,
        last_name -> Bpchar,
        email_address -> Bpchar,
        mobile_number -> Nullable<Bpchar>,
        role_id -> Int8,
        date_of_birth -> Nullable<Date>,
        password -> Bpchar,
        activated_flag -> Bpchar,
        race_country_id -> Int8,
        profile_picture_url -> Nullable<Bpchar>,
    }
}

allow_tables_to_appear_in_same_query!(
    table_area,
    table_country,
    table_role,
    table_state,
    table_university,
    table_user,
);
