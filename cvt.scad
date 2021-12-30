// Higher tenting degree may produce a taller structure.
max_tenting_degree = 35;

// Plate to attach to the ball.
plate_length = 25.4 * 6;
plate_width = 25.4 * 4.5;

// The ball in the ball joint. A larger ball provides better stability but increases
// the height of the structure.
ball_radius = 25.4 * 1.125;
// The plateau supporting the plate. If the area is too small, the plate may flex.
// The default gives about 45 degree overhang at the base so it can be printed
// without supports.
ball_cut_ratio = 0.3;
ball_plateau_height = ball_radius * (1 - ball_cut_ratio);

// The lowest point that the plate can reach, assuming the plate is not rotated
// on the Z-axis. This inputs to the socket's height.
plate_lowest_z = plate_length / 2 * sin(-max_tenting_degree) +
                 ball_plateau_height * cos(-max_tenting_degree);

// Space between the ball and the socket. Could be 0 if the printer is very precise.
// Here we just want the socket to close well around the ball.
space = 0.2;

// Geometry of the socket.
socket_radius = ball_radius + space;
socket_closing_degree = 20;  // to prevent the ball from escaping
socket_thickness = 4;
socket_depth = socket_radius * (1 + sin(socket_closing_degree));
socket_height =
    max(socket_radius, -plate_lowest_z) + socket_radius * sin(socket_closing_degree);
socket_base_height = socket_height - socket_depth;

// The disc at the bottom to provide stability.
disc_radius = ball_radius * 1.6;
disc_thickness = 3;

// The number of sides to render a circle.
$fn = 100;
// The extra cut for difference() so the cut is unambiguous.
d = 0.1;
// Pseudo-infinity for splitting the socket into two parts.
inf = 999;

module plate(height = socket_radius) {
  translate([ -plate_length / 2, -plate_width / 2, ball_plateau_height ])
      cube([ plate_length, plate_width, height ]);
}

module ball() {
  difference() {
    sphere(r = ball_radius);
    translate([ 0, 0, ball_plateau_height ])
        cylinder(r = ball_radius, h = ball_radius * ball_cut_ratio);
  }
}

module socket() {
  difference() {
    translate([ 0, 0, -socket_radius - socket_base_height ]) union() {
      cylinder(r = socket_radius + socket_thickness, h = socket_height);

      // Ledges for binder clips.
      ledge_length = socket_thickness * 3;
      ledge_width = socket_thickness * 4;
      for (degree = [ 0, 180 ]) {
        rotate([ 0, 0, degree ])
            translate([ -ledge_length / 2, -socket_radius - ledge_width, 0 ]) {
          difference() {
            cube([ ledge_length, ledge_width, socket_height ]);
            translate([ -d, 0, socket_height - ledge_width * sin(30) ])
                rotate([ 30, 0, 0 ])
                    cube([ ledge_length + d * 2, ledge_width, socket_height ]);
          }
        }
      }
    }
    sphere(r = socket_radius);
    rotate([ 0, max_tenting_degree, 0 ]) plate();
  }
  translate([ 0, 0, -socket_radius - socket_base_height ]) disc();
}

module socket_left() {
  difference() {
    socket();
    translate([ 0, -inf / 2, -inf / 2 ]) cube([ inf, inf, inf ]);
  }
}

module socket_right() {
  difference() {
    socket();
    translate([ -inf, -inf / 2, -inf / 2 ]) cube([ inf, inf, inf ]);
  }
}

module disc() {
  translate([ 0, 0, -disc_thickness ]) cylinder(r = disc_radius, h = disc_thickness);
}

module pieces() {
  translate([ 0, 0, -ball_radius * ball_cut_ratio - socket_base_height ])
      rotate([ 180, 0, 0 ]) ball();
  translate([ disc_radius + ball_radius, 0, disc_thickness + space ]) socket_left();
  translate([ disc_radius + ball_radius + 10, 0, disc_thickness + space ]) socket_right();
}

module assembly(tent = max_tenting_degree, tilt = 0) {
  rotate([ 0, tent, 0 ]) rotate([ 0, 0, tilt ]) {
    ball();
    plate(1);
  }
  socket();
}

module animation() { assembly($t * max_tenting_degree, $t * -30); }

// Pieces to be printed.
translate([ plate_length / 2 + ball_radius, 0, 0 ]) pieces();

// Uncomment to see the assembly of pieces.
// assembly();

// Uncomment to see the rotating plate with OpenScad's "Animate" view.
// animation();

