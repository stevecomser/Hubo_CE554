clc; close all; clear all;

syms d r l x1 x2 x3 y1 y2 y3 z1 z2 z3 theta rho real

assume(theta > 0 & theta < 2*pi)
assume(rho > 0 & rho < 2*pi)

assume(d > 0); assume(r > 0); assume(l > 0);
assume(z1 > 0); assume(z2 > 0); assume(z3 > 0);

% D2R = pi/180;
% R2D = 180/pi;

% r = 30;
% l = 120;

% alpha: y-axis rotation, link [rad]
% beta: x-axis rotation, link 
% theta: y-axis rotation, centor [rad]
% rho: x-axis rotation, centor [rad]

origin = [eye(3) [0 0 0]'; [0 0 0 1]];

b1 = origin*[eye(3) [r 0 0]'; [0 0 0 1]];
b2 = origin*[eye(3) [(-0.5)*r (sqrt(3)/2)*r 0]'; [0 0 0 1]];
b3 = origin*[eye(3) [(-0.5)*r (-sqrt(3)/2)*r 0]'; [0 0 0 1]];

origin_to_P = origin*[rotx_rad(rho)*roty_rad(theta) [0 0 0]'; [0 0 0 1]];
P = origin_to_P*[roty_rad(theta)*rotx_rad(rho) [0 0 d]'; [0 0 0 1]];

b1 = [b1(1,4), b1(2,4), b1(3,4)]; b2 = [b2(1,4), b2(2,4), b2(3,4)]; b3 = [b3(1,4), b3(2,4), b3(3,4)];
p1 = [x1, y1, z1]; p2 = [x2, y2, z2]; p3 = [x3, y3, z3];