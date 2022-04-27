function [Vertex]=Read_and_display()
%% STL�ļ���MATLAB�еĶ�ȡ
[Face, Vertex] = stlread('Warship.stl');
%% STL�ļ���MATLAB�е���ʾ
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
%% STL�ļ���MATLAB�е�д��
% stlWrite('Model.stl', Face, Vertex);