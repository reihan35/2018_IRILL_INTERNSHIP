open Lwt
Lwt.bind (Lwt_io.read_line Lwt_io.stdin) (fun str -> Lwt_io.printlf "You typed %S" str)
