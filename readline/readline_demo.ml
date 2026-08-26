let () =
  match Readline.readline "Enter something: " with
  | None -> ()
  | Some line -> print_endline ("You said: " ^ line)
