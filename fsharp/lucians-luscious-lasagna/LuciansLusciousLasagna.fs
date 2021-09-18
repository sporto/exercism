module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven m =
    expectedMinutesInOven - m

let preparationTimeInMinutes layers =
    layers * 2

let elapsedTimeInMinutes layers mins =
    preparationTimeInMinutes layers + mins