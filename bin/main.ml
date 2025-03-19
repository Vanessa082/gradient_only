open Claudius

type color = int

let int_to_rgb (c : color) : int * int * int =
  let r = (c lsr 16) land 0xFF in
  let g = (c lsr 8) land 0xFF in
  let b = c land 0xFF in
  (r, g, b)

let rgb_to_int (r : int) (g : int) (b : int) : color =
  (r lsl 16) lor (g lsl 8) lor b

let lerp a b t =
  int_of_float ((1.0 -. t) *. float_of_int a +. t *. float_of_int b)

let mix_color c1 c2 t =
  let (r1, g1, b1) = int_to_rgb c1 in
  let (r2, g2, b2) = int_to_rgb c2 in
  rgb_to_int (lerp r1 r2 t) (lerp g1 g2 t) (lerp b1 b2 t)

(* ---------- Animation (tick) Function ---------- *)

let tick t screen _prev _inputs =
  let width, height = Screen.dimensions screen in
  let c1 = 0xFF0000 in  (* Red *)
  let c2 = 0x00FF00 in  (* Green *)
  let c3 = 0x0000FF in  (* Blue *)

  (* Center of the screen *)
  let cx = float_of_int (width / 2) in
  let cy = float_of_int (height / 2) in

  (* For each pixel, compute a swirling blend based on its position and time *)
  Framebuffer.init (width, height) (fun x y ->
    let xf = float_of_int x in
    let yf = float_of_int y in
    let dx = xf -. cx in
    let dy = yf -. cy in
    let dist = sqrt (dx *. dx +. dy *. dy) in
    let angle = atan2 dy dx in
    let mix1 = (sin (dist /. 10. +. float_of_int t /. 50.) +. 1.) /. 2. in
    let mix2 = (cos (angle +. float_of_int t /. 50.) +. 1.) /. 2. in
    let mix12 = mix_color c1 c2 mix1 in
    mix_color mix12 c3 mix2
  )

(* ---------- Main Entry Point ---------- *)

let () =
  Screen.create 640 480 1 (Claudius.Palette.generate_plasma_palette 1024)
  |> Base.run "Mixing Palette" None tick
