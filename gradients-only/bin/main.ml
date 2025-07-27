open Claudius

let tick t screen _prev _inputs =
  let width, height = Screen.dimensions screen in
  let palsize = Palette.size (Screen.palette s) in

  Framebuffer.init (width, height) (fun x y ->
    let xf = float_of_int x /. float_of_int width in
    let yf = float_of_int y /. float_of_int height in

    let shift = (sin (float_of_int t /. 50.0) +. 1.0) /. 2.0 in
    let gradient_value = int_of_float (palsize. *. (xf *. 0.5 +. yf *. 0.5 +. shift *. 0.5)) in
    
    gradient_value mod palsize
  )

let () =
  Screen.create 640 480 1 (Claudius.Palette.generate_plasma_palette 256)
  |> Base.run "Genuary Day 22: Gradients Only" None tick
