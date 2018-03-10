clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Weymouth (Nx2D run):') 
disp('Ray trace run')
disp('Geometric hat beams in Cartesian coordinates')

system('cp Weymouth.bty WeymouthNx2D_ray.bty');
system('bellhop3d.exe WeymouthNx2D_ray');
system('rm WeymouthNx2D_ray.bty');

plotray3d('WeymouthNx2D_ray.ray')

disp('done.')
