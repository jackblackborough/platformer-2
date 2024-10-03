
// Move in a circle
dir += rotSpd;

// Get our target positions
var _targetX = xstart + lengthdir_x(radius, dir);
var _targetY = ystart + lengthdir_y(radius, dir);

// Get our xSpd and ySpc
xspd = _targetX - x;
yspd = _targetY - y;

// Move
x += xspd;
y += yspd;