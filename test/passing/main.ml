open Stdlib.Effect.Deep

exception%effect E: unit

let () =
  Printexc.record_backtrace true;
  let raiser () = raise Not_found in
  match raiser () with
  | e -> e
  | [%effect? E, k] ->
    continue k ()
