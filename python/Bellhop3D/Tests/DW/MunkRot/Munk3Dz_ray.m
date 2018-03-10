clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Munk SSP:') 
disp('Ray trace run') 
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe Munk3Dz_ray');

plotray3d('Munk3Dz_ray.ray')

disp('done.')
