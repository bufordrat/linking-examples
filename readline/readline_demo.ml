let () =
  Readline.init () ;
  match Readline.readline ~prompt:"Type a string: " () with
  | None -> ()
  | Some line -> Printf.printf "You typed '%s'!\n%!" line
