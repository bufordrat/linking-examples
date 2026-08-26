let rex = Pcre2.regexp {|\d{3}-\d{4}|}

let string = "phone: 555-1234"

let print_output input =
  if Pcre2.pmatch ~rex input
  then Printf.printf
         "the string '%s' contains a phone number\n%!"
         input
  else Printf.printf
         "the string '%s' does not contain a phone number\n%!"
         input

let () = print_output string
