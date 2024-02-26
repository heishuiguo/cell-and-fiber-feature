function edgesNmsFolder(inDir, outDir, r)
if ~exist(outDir, 'dir'), mkdir(outDir);end
iids = dir(fullfile(inDir, '*.png'));
% if numel(iids) == numel(dir(fullfile(outDir, '*.png'))), return; end
for i=1:length(iids)
    edge = imread(fullfile(inDir, iids(i).name));
    edge = single(edge)/255;

    [Ox,Oy]=gradient2(convTri(edge,4));
    [Oxx,~]=gradient2(Ox); 
    [Oxy,Oyy]=gradient2(Oy);
    O=mod(atan(Oyy.*sign(-Oxy)./(Oxx+1e-5)),pi);
    nms=edgesNmsMex(edge,O,r,5,1.01,8);
    imwrite(nms, fullfile(outDir, iids(i).name));
end
