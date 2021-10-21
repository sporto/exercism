module LogLevels

let message (logLine: string) : string =
    logLine
        .Replace("[INFO]: ", "")
        .Replace("[WARNING]: ", "")
        .Replace("[ERROR]: ", "")
        .Trim()

let logLevel (logLine: string) : string =
    if logLine.StartsWith("[INFO]") then
        "info"
    else if logLine.StartsWith("[WARNING]") then
        "warning"
    else
        "error"

let reformat (logLine: string) : string =
    $"{message logLine} ({logLevel logLine})"
