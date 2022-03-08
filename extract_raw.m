num_subj = 15;
ch = 41;
saving_folder = 'raw NH';
folder = uigetdir;
saving_path = strcat(folder,'\', saving_folder);
if ~exist(saving_path)
    mkdir(saving_path);
end
folder_info = dir(folder);
beta_cell = {};
counter = 0;
SO_oxy_group    = [];
NO_oxy_group    = [];
SIN_oxy_group   = [];
SO_deoxy_group  = [];
NO_deoxy_group  = [];
SIN_deoxy_group = [];
for i = 1:length(folder_info)
    if folder_info(i).isdir == 1
        folder_name = folder_info(i).name;
        if length(folder_name) > 3
            counter = counter+1;
             if counter > num_subj
              break
             end
             txt = strcat("loading raw values for subject ", num2str(counter));
             disp(txt);
            folder_path = strcat(folder, '\', folder_name);
            undrscrl = strfind(folder_name, '_');
            subj_file = strcat(folder_name(1:undrscrl(1)+3), '.mat');
            subj_file_path = strcat(folder_path, '\', subj_file);
            LD = load(subj_file_path);
            raw = LD.output.dod.dataTimeSeries  ;
            name = strcat(saving_path,'\raw', num2str(counter),'.mat');
            save (name, 'raw');
            
        end
    end
end