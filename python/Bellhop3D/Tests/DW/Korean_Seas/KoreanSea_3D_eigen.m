 % CPU Time =       0.189E+04s
 
clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp KoreanSea.bty KoreanSea_3D_eigen.bty');
system('cp KoreanSea.ssp KoreanSea_3D_eigen.ssp');

disp('Bellhop3D - Korean Sea 3D eigenrays (3D run):') 
disp('Eigenray trace run')
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe KoreanSea_3D_eigen');
system('rm KoreanSea_3D_eigen.bty');
system('rm KoreanSea_3D_eigen.ssp');

plotray3d('KoreanSea_3D_eigen.ray')

disp('done.')
