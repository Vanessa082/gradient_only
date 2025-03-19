# Gradient Only

Gradient Only is a creative animated demo built using the [Claudius](https://github.com/claudiusFX/Claudius) library for OCaml. It generates a dynamic, swirling gradient for each pixel, the red (r) component increases with the x-coordinate, the green (g) component increases with the y-coordinate, and the blue (b) component decreases as the red increases, resulting in a gradient that transitions smoothly across the screen.Although the prompt specifies "Gradients only," the palette is still defined using Claudius.Palette.generate_plasma_palette 256 to maintain compatibility with the Claudius framework.

## Prerequisites

- [OCaml](https://ocaml.org/) (version 5.x recommended)
- [opam](https://opam.ocaml.org/) package manager
- [dune](https://dune.build/) build system
- [Claudius](https://github.com/claudiusFX/Claudius) library (vendored into your project or installed separately)
  
## Installation

1. **Clone the Repository:**

   ```bash
   $ git clone https://github.com/Vanessa082/mixingcolorspalette
   
    $ cd expanded-palette
    $ dune build
    $ dune exec ./bin/main.exe
   ```

## Preview

[gradient-only.webm](https://github.com/user-attachments/assets/482517ce-89f2-45a9-a530-7e7d3a66aa60)
