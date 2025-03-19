open Claudius

let tick t screen _prev _inputs =
  let width, height = Screen.dimensions screen in

  Framebuffer.init (width, height) (fun x y ->
    let xf = float_of_int x /. float_of_int width in
    let yf = float_of_int y /. float_of_int height in

    let shift = (sin (float_of_int t /. 50.0) +. 1.0) /. 2.0 in
    let r = int_of_float (255. *. xf *. shift) in
    let g = int_of_float (255. *. yf *. shift) in
    let b = int_of_float (255. *. (1.0 -. shift)) in

    (r lsl 16) lor (g lsl 8) lor b
  )

let () =
  Screen.create 640 480 1 (Claudius.Palette.generate_plasma_palette 256)
  |> Base.run "Genuary Day 22: Gradients Only" None tick
