use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    h: i8,
    m: i8,
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.h, self.m)
        // Ok(())
    }
}

impl Clock {
    pub fn new(h: i8, m: i8) -> Clock {
        Clock { h, m }
    }

    pub fn add_minutes(self: Clock, mins: i8) -> Clock {
        Clock { h : self.h, m : self.m + mins }
    }
}



