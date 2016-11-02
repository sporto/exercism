module Gigasecond

open System

let seconds = pown 10.0 9

let gigasecond (datetime: DateTime) =
    datetime
        .AddSeconds(seconds)
        .Date
