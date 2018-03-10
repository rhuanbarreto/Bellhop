clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp Taiwan.bty TaiwanNx2D_ray.bty');
system('cp Taiwan.ssp TaiwanNx2D_ray.ssp');

disp('Bellhop3D - Taiwan (Nx2D run):') 
disp('Ray trace run')
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe TaiwanNx2D_ray');
system('rm TaiwanNx2D_ray.bty');
system('rm TaiwanNx2D_ray.ssp');

plotray3d('TaiwanNx2D_ray.ray')

disp('done.')
