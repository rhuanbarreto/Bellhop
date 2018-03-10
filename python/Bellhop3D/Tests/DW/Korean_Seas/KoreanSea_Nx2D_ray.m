clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp KoreanSea.bty KoreanSea_Nx2D_ray.bty');
system('cp KoreanSea.ssp KoreanSea_Nx2D_ray.ssp');

disp('Bellhop3D - Korean Sea 3D (Nx2D run):') 
disp('Ray trace run')
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe KoreanSea_Nx2D_ray');
system('rm KoreanSea_Nx2D_ray.bty');
system('rm KoreanSea_Nx2D_ray.ssp');

plotray3d('KoreanSea_Nx2D_ray.ray')

disp('done.')
