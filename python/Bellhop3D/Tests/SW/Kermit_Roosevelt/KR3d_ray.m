clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Kermit-Roosevelt:') 
disp('ray calculation')

plotbty3d('KR3d_ray.bty');

system('bellhop3d.exe KR3d_ray');

plotray3d('KR3d_ray.ray');

disp('done.')
