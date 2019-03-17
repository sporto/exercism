open Base
open Poly

type nucleotide = A | C | G | T

let count (a, b) : int =
	if a = b then
		0
	else
		1

let sum =
	List.fold_left ~f:(+) ~init:0

let hamming_distance (l1: nucleotide list) (l2: nucleotide list) : int option =
	match List.zip l1 l2 with
	| None ->
		None
	| Some zipped ->
		zipped
			|> List.map ~f:count
			|> sum
			|> fun s -> Some s