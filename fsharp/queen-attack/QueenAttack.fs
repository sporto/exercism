module QueenAttack

let create ((r, c): int * int) =
       r > 0 && r < 8 && c > 0 && c < 8

let canAttack ((r1, c1): int * int) ((r2, c2): int * int) =
    r1 = r2 || c1 = c2 || (r1 - c1) = (r2 - c2) || (r1 + c1) = (r2 + c2)
