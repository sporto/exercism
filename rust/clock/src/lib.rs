use std::fmt;

fn modulo(a: i16, b: i16) -> i16 {
    (a % b + b) % b
}

#[derive(Debug, PartialEq)]
pub struct Clock {
    h: i16,
    m: i16,
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.h, self.m)
    }
}

impl Clock {
    pub fn new(h: i16, m: i16) -> Clock {
        let mins = modulo(h * 60 + m, 24 * 60);
        let h = mins / 60;
        let m = mins % 60;
        Clock { h, m }
    }

    pub fn add_minutes(self: Clock, mins: i16) -> Clock {
        Clock::new(self.h, self.m + mins)
    }
}



