clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp Taiwan.bty Taiwan3D_ray.bty');
system('cp Taiwan.ssp Taiwan3D_ray.ssp');

disp('Bellhop3D - Taiwan (Nx2D run):') 
disp('Ray trace run')
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe Taiwan3D_ray');
system('rm Taiwan3D_ray.bty');
system('rm Taiwan3D_ray.ssp');

plotray3d('Taiwan3D_ray.ray')

disp('done.')
