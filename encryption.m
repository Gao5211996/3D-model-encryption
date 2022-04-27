clc
clear
           [Face, Vertex] = stlread('Banana.stl'); 
%           [Face, Vertex] = stlread('Clover.stl');
%              [Face, Vertex] = stlread('Hummer.stl');
%              [Face, Vertex] = stlread('MazdaRX-7.stl');
%                [Face, Vertex] = stlread('pumpkin.stl');
%                  [Face, Vertex] = stlread('racingcar.stl');
%                   [Face, Vertex] = stlread('Shamrock.stl');
%          [Face, Vertex] = stlread('Tank.stl');
%        [Face, Vertex] = stlread('Warship.stl');
   [UU,MAC,AA]=jiami1(Vertex);
%    [Vertex]=Read_and_display()
figure('color',[1 1 1])
        patch('Faces', Face, 'Vertices', UU, ...
            'FaceColor', [1 1 1], ...
            'EdgeColor', 'none', ...
            'FaceLighting', 'gouraud', ...
            'AmbientStrength', 0.15);
  
         camlight('headlight');
         material('dull');
       
%          axis('image');
         view([-20 20]);
