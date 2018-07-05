(*let () =
  let s = ref 0.0 in 
  let ic = open_in "sysobrowser.txt" in
    while true do
      let line = input_line ic in
	  s:=!s+.(float_of_string line)
    done;
  print_float !s
*)


let input_line_opt ic =
  try Some (input_line ic)
  with End_of_file -> None
 
let read_lines ic =
  let rec aux acc =
    match input_line_opt ic with
    | Some line -> aux (line::acc)
    | None -> (List.rev acc)
  in
  aux []
 
let lines_of_file filename =
  let ic = open_in filename in
  let lines = read_lines ic in
  close_in ic;
  (lines)

let () =

let s =  Sys.argv.(1) in

  let lines = lines_of_file s in
 print_float ((List.fold_left (fun a b -> a+.b) 0.0 (List.map (fun x -> (float_of_string x)) lines))/.(List.fold_left (fun a b -> a+.1.0) 0.0 (List.map (fun x -> (float_of_string x +. 1.0)) lines)))

