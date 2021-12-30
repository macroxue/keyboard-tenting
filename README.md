# Continuously Variable Tenting (CVT)

This is a solution for flexible and reliable tenting of keyboards with very low
cost. Below is a short video showing it in action. A DIYer who has access to
3D-printing can easily build it and customize it.

https://user-images.githubusercontent.com/1887856/147719232-e44d4478-9f9e-47b6-bbbc-71b62043c802.mp4

## The Structure

The structure is essentially a steel plate on a
[ball joint](https://en.wikipedia.org/wiki/Ball_joint).
Any keyboard with magnets at the back can attach to the steel plate so it's a
universal platform. The ball joint allows the plate to rotate continuously in
a certain range so it's easy to tent and tilt the keyboard to one's liking.

## Parts

 * One 6"x12" stainless steel sheet, 0.03" or slightly thicker
 * Two 3D-printed ball joints
 * Four 1.25" binder clips
 * Eight 10mm disc magnets, if needed

## Tools

 * Heavy duty scissors
 * 3D printer
 * Paper
 * Super glue
 * A candle and a lighter
 * Tape

## Installing Magnets

The best is to have magnets oriented the same way, all north poles up or all
north poles down. My keyboard's case has a very thin bottom so I just
electric-taped magnets inside the case, one at each corner. For a large/heavy
keyboard, more or larger magnets may help.

Test the installation on the steel sheet, vertically and upside down. If
needed, a few magnets can be attached to the back side of the sheet to help the
keyboard stay in place.

## Cutting the Steel Sheet

The plate can be of any shape/size as long as the keyboard can stay on it. For
simplicity, I would just go with a rectangle with rounded corners, because
that's about as much as I could do using heavy duty scissors. Be careful that
the sheet could be too hard to cut or too easy to distort. Test-cutting near
the edge could be a good idea.

By default, the model assumes the plate is 6 inches in length and shorter in width.
If a significantly larger geometry is desired, one needs to change the 3D model
in [cvt.scad](https://github.com/macroxue/keyboard-tenting/blob/master/cvt.scad)
accordingly to avoid the plate touching the desk when tented at the maximal angle.

## Printing the Ball Joint

![ball-joint](https://user-images.githubusercontent.com/1887856/147719360-b5679326-b0b1-43cc-b1fe-3ecac65d28e0.jpg)

Print either [cvt-35.stl](https://github.com/macroxue/keyboard-tenting/blob/master/cvt-35.stl)
for 35 degree of tenting maximally or
[cvt-45.stl](https://github.com/macroxue/keyboard-tenting/blob/master/cvt-45.stl) for 45
degree. The 35-degree one is slightly shorter than the 45-degree one, if that
matters. Each print produces three pieces for one hand, so the same model needs
to be printed twice. It takes about 12 hours to finish two prints on my
FlashForge Creator Pro.

My prints are with ABS filament. Other material should work too but I didn't
verify. A bit later melted wax will go into the socket so the material must
withstand the heat and not deform.

One can also modify [cvt.scad](https://github.com/macroxue/keyboard-tenting/blob/master/cvt.scad)
to customize the print, which is rendered by [OpenSCAD](https://openscad.org/). Please pay attention to
comments in the model and visually examine the rendered output for any issues
with structural integrity. The ball may need supports near the base if the
overhang is more than 45 degree. It can be a good idea to test-print a 50% model
after significant changes.

The two socket pieces may need to be polished to close the socket well.
Clamp the two pieces together by the binder clips. If the socket wobbles on
a smooth surface when slightly touched, it should be fixed and the protruding
parts can be scratched off by a knife. This usually happens around the edge
touching the printer's bed.

![50-percent](https://user-images.githubusercontent.com/1887856/147723242-b99901da-a12d-4dc0-b14e-c7eeab7a8484.jpg)

## Gluing the Plate and the Ball

Put the ball at the center of the plate and wrap a paper stripe (1" to 2" wide)
around it.  Tape the paper cylinder to the plate and take the ball out.
Drop the ball with the flat side down into the cylinder and it should land
perfectly at the desired location. Apply super glue to the flat side and drop
the ball the same way again. Press the ball down slightly so the glue is more
evenly distributed.  Let it sit for a minute and the ball is permanently glued
to the plate.

## Waxing the Socket

Put all things together, the ball in the socket and the socket clamped by
binder clips. Try turning the plate to see how tight the joint is. Most likely
it's a bit loose. If so, take the ball out and light a candle. Drip melted wax
into the socket and spread it on the surface. If the socket can't close well
after this, just scratch some wax off. Test the tightness and repeat until it's
about right.

## Stablizing the Joint

All 3D-printed objects are slippery on a smooth surface. My solution is to put
the joint on a rubber mat. Another way is to rubber-coat its bottom with Plasti
Dip, but the process could be a little hazardous, requiring mask and glove protection.

## More Testing

Put the keyboard on the plate. Adjust the orientation of the keyboard by
rotating the ball joint like how it's done in the video and see if any fine
tuning is needed.

To find the most comfortable position, one can quickly move or rotate the keyboard
on the plate without adjusting the ball joint every time.

## Acknowledgment

Many thanks to reditters of [r/ErgoMechBoards](https://www.reddit.com/r/ErgoMechKeyboards/)
who contributed to the discussion of the design in these threads.
* https://www.reddit.com/r/ErgoMechKeyboards/comments/ropcwq/continuously_variable_tenting_ball_joint_steel/
* https://www.reddit.com/r/ErgoMechKeyboards/comments/rqv95e/a_prototype_of_cvt_continuously_variable_tenting/
