function [Vertex]=Read_and_display()
%% STL文件在MATLAB中的读取
[Face, Vertex] = stlread('Warship.stl');
%% STL文件在MATLAB中的显示
figure
        patch('Faces', Face, 'Vertices', Vertex, ...
            'FaceColor', [0.5 0.5 0.5], ...
            'EdgeColor', 'none', ...
            'FaceLighting', 'gouraud', ...
            'AmbientStrength', 0.15);
  
         camlight('headlight');
         material('dull');
       
%          axis('image');
         view([-20 20]);

        %%
%% STL文件在MATLAB中的写入
% stlWrite('Model.stl', Face, Vertex);