module BookingUpForBeauty

// The following line is needed to use the DateTime type
open System

let schedule (appointmentDateDescription: string) : DateTime =
    DateTime.Parse(appointmentDateDescription)

let hasPassed (appointmentDate: DateTime) : bool = appointmentDate < DateTime.Now

let isAfternoonAppointment (appointmentDate: DateTime) : bool =
    appointmentDate.Hour >= 12
    && appointmentDate.Hour < 18

let description (appointmentDate: DateTime) : string =
    let formatted = appointmentDate.ToString("G")
    $"You have an appointment on {formatted}."

let anniversaryDate () : DateTime = new DateTime(2021, 9, 15, 0, 0, 0)
