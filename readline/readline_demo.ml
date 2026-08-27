let () =
  Readline.init () ;
  match Readline.readline ~prompt:"Type a string: " () with
  | None -> ()
  | Some line -> print_endline ("You said: " ^ line)
