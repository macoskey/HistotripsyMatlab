% DICOM Viewer
%% View slice-by-slice
source_dir = pwd; %uigetdir([]);
count = length(dir([source_dir, '\*.dcm']));
matrix = zeros(497,575,2302);
for n = 1:count
    if n <= 10
        number = (['000',num2str(n-1)]);
    elseif n <= 100
        number = (['00',num2str(n-1)]);
    elseif n <= 1000
        number = (['0',num2str(n-1)]);
    else
        number = num2str(n-1);
    end
    string = (['ArteryMark2_',number,'.dcm']);
    x = dicomread(string);
    %matrix(:,:,n) = x;
    imagesc(x)
    colormap('cool')
    pause(0.0000001)
end

%% Downsample
for n = 1:length(matrix)
    b = mod(n,11);
    if b ~= 0
        matrix(:,:,n) = 0;
    end
end




