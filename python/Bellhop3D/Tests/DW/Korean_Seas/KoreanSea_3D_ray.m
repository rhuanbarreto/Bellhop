clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp KoreanSea.bty KoreanSea_3D_ray.bty');
system('cp KoreanSea.ssp KoreanSea_3D_ray.ssp');

disp('Bellhop3D - Korean Sea 3D (3D run):') 
disp('Ray trace run')
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe KoreanSea_3D_ray');
system('rm KoreanSea_3D_ray.bty');
system('rm KoreanSea_3D_ray.ssp');

plotray3d('KoreanSea_3D_ray.ray')

disp('done.')
