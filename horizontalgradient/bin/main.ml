open Claudius

(* tick is the function responsible for screen update 
t represents the time 
s the screen where drawing happens
underscore indicates the are unused 
*)

let tick t s _prev _inputs =
  let width, height = Screen.dimensions s in
 Framebuffer.init (width, height) (fun x _ ->
  let xf = float_of_int x /. float_of_int width in
  int_of_float (255. *. (sin (xf +. float_of_int t /. 50.) *. 0.5 +. 0.5))
)


let () =
  Screen.create 640 480 1 (Claudius.Palette.generate_plasma_palette 256)
  |> Base.run "Genuary Demo: Gradients Only" None tick
