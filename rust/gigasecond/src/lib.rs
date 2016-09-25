extern crate chrono;
use chrono::*;

pub fn after(t: DateTime<UTC>) -> DateTime<UTC> {
	t + Duration::seconds(1_000_000_000)
}