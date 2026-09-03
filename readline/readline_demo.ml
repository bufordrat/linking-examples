let () =
  Readline.init () ;
  match Readline.readline ~prompt:"Type a string: " () with
  | None -> ()
  | Some "" -> print_endline "You didn't type anything!"
  | Some line -> Printf.printf "You typed '%s'!\n%!" line
