%% Change current working directory (cd), add a folder to search path of MATLAB(addpath)
clear % clear all variables
clc   % clear all command window
%define location of working folder
File_operation_dir = 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations'

%add the folder into search path of matlab
addpath(File_operation_dir)

%% indentify current folder using pwd
pwd

%% cd change current folder
%change to a location or a directory
cd(File_operation_dir)

cd ..
cd 'File Operations'
cd ../..  %up 2 level
doc cd %for more

%% list folder contents
% using dir
all_f = dir(); %show all files and folders
all_f(2)  %the first element
all_f(3).name
disp(length(all_f))
for i = 1: numel(all_f)
    disp(all_f(i))
end

m_file = dir('File*.m'); %show all m file with frefixed name is File
disp(length(m_file))
for i = 1: numel(m_file)
    disp(m_file(i))
end

all_File = dir('File*'); %show all file with frefixed name is File
disp(length(all_File))
for i = 1: numel(all_File)
    disp(all_File(i))
end


%% Setup permanent delete or just put in recycle folder
%check the recycle status
state = recycle
%turn on recycle
recycle('on')

%% check if file, folder is existed: exist name searchType
%result: 0 is not existed, from 1 to 8 is existed.
%search type can be: builtin, class, dir, file, var
exist 'images\000142.jpg' file
exist 'SASI_example' dir

%% check if input is file or folder
isfile 'images\000142.jpg'
isfolder 'images\000142.jpg'


%% display contents of file
type 'images\000142.jpg'
type text_test_file.txt
type Mission117.txt
type FileOperations.m

%% visdiff compare two files or folders visdiff(name1,name2,type)
%type can be: 'text', 'binary' 'xml'
visdiff('text_test_file_01.txt','text_test_file_02.txt','text')
visdiff('Mission117.txt','Mission118.txt','text')
visdiff('a09_194_135.qgs','a09_194_133.qgs','XML')

%% list MATLAB files in folder
list = what ('C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations');
disp(fullfile(list.path,list.m));

%% locate functions and file
%where is startup matlab file
which startup
%where is who function
which who


%% Fullfile name construction
foldler = 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\images'
file = '000142.jpg'
full_file = fullfile(foldler,file)
disp(full_file)
dir = full_file.folder
disp(dir)
file_name = full_file.name
disp(file_name)

%% Loop through all images file in a folder and display them
cd 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\images'
image_files_dir = dir('00*.jpg');
msg = ['No of image: ',int2str(length(image_files_dir))]
disp(msg)
for i = 1: numel(image_files_dir)  %for each file
   disp(image_files_dir(i))
   Dir = ['Folder: ', image_files_dir(i).folder]; %display
   %disp(Dir)
   F = ['File: ', image_files_dir(i).name];
   %disp(F)
   i_fullpath = fullfile(image_files_dir(i).folder,image_files_dir(i).name);
   %disp(['Fullpath: ', i_fullpath])
   %figure
   %show the image
   imshow(imread(i_fullpath))
end

% cd 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\SASI_example'
% sasi_images = dir('SON*.TIF');
% for i = 1:numel(sasi_images)
%    i_fullpath = fullfile(sasi_images(i).folder,sasi_images(i).name);
%    disp(i_fullpath)
%    imshow(imread(i_fullpath))
% end

%% create,and delete txt files, folders
%create a new file named: temporary folder.txt
temp_file_name = 'temporary folder.txt';
fclose(fopen(temp_file_name, 'w'));
%delte folder
cd(File_operation_dir)
temp_file_path = fullfile(File_operation_dir,temp_file_name)

if exist(temp_file_path,'file')
   fprintf('Already existed %s\n',temp_file_path);
else
    fprintf('Does not exist %s\n',temp_file_path);
end
delete(temp_file_path)

%delte file
temp_folder = 'temporary folder';

if exist(temp_folder,'dir')
   fprintf('Already existed %s\n',fullfile(File_operation_dir,temp_folder));
else
    mkdir(temp_folder)
end
% rmdir(temp_folder)

%% Using loop, copy all file from one folder to another folder
%using loop to copy multiple files
src_folder = 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\images';
dest_folder = 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\images_copy';
%check if destination folder is not created then create it
if exist(dest_folder,'dir')
    fprintf('%s already existed \n',dest_folder);
elseif mkdir(dest_folder)
end

cd(src_folder)
%list all images in source folder
image_files_dir = dir('00*.jpg');

%loop through all images in source folder, copy them to new destination
%folder.
for i = 1: numel(image_files_dir)
   src_file = fullfile(src_folder,image_files_dir(i).name);
   dst_name = strcat(image_files_dir(i).name,'_copy');
   dst_file = fullfile(dest_folder,image_files_dir(i).name);
   
   if exist(dst_file,'file')
       fprintf('Already existed %s\n',dst_file);
   else
       copyfile(src_file,dst_file)
   end
end
cd(dest_folder)


%% rename file
%using loop to copy and rename multiple files
src_folder_copy = 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\images_copy';
cd(src_folder_copy)
%list all images in source copy folder, check if it is avaialble, if not
%comeback and copy them
image_files_dir = dir('00*.jpg');
for i = 1:numel(image_files_dir)
    x = sprintf('Image file name: %s',image_files_dir(i).name);
    disp(x);
    x = sprintf('Image file path: %s',fullfile(image_files_dir(i).folder,image_files_dir(i).name));
    disp(x);
end

% copy and rename
dest_folder_rename = 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\images_copy_rename';
%check if destination folder is not created then create it
if exist(dest_folder_rename,'dir')
    fprintf('%s already existed \n',dest_folder_rename);
elseif mkdir(dest_folder_rename)
end
cd(src_folder_copy)
% copy
image_files_dir = dir('00*.jpg');
for i = 1: numel(image_files_dir)
   src_file = fullfile(src_folder_copy,image_files_dir(i).name)
   src_name = extractBefore(image_files_dir(i).name,'.');
   src_name = convertCharsToStrings(src_name)  %just convert from chars to string
   src_ext = extractAfter(image_files_dir(i).name,'.');
   src_ext = convertCharsToStrings(src_ext)    %just convert from chars to string
   dst_name = src_name+"_new"+"."+src_ext
   dst_file = fullfile(dest_folder_rename,dst_name)
   if exist(dst_file,'file')
       fprintf('Already existed %s\n',dst_file);
   else
       copyfile(src_file,dst_file)
       %movefile(src_file,dst_file)
   end
end
cd(dest_folder_rename)

%% move file
%using loop to move and rename multiple files

cd(src_folder_copy)
%list all images in source copy folder, check if it is avaialble, if not
%comeback and copy them
image_files_dir = dir('00*.jpg');
for i = 1:numel(image_files_dir)
    x = sprintf('Image file name: %s',image_files_dir(i).name);
    disp(x);
    x = sprintf('Image file path: %s',fullfile(image_files_dir(i).folder,image_files_dir(i).name));
    disp(x);
end


dest_folder_move = 'C:\PhD20162020\MATLAB\MATLAB_help_center\Programming\Files and Folders\File Operations\images_copy_move';
%check if destination folder is not created then create it
if exist(dest_folder_move,'dir')
    fprintf('%s already existed \n',dest_folder_move);
elseif mkdir(dest_folder_move)
end
%folder.

image_files_dir = dir('00*.jpg');
for i = 1: numel(image_files_dir)
   src_file = fullfile(src_folder_rename,image_files_dir(i).name)
   src_name = extractBefore(image_files_dir(i).name,'.');
   src_name = convertCharsToStrings(src_name)  %just convert from chars to string
   src_ext = extractAfter(image_files_dir(i).name,'.');
   src_ext = convertCharsToStrings(src_ext)    %just convert from chars to string
   dst_name = src_name+"_new"+"."+src_ext
   dst_file = fullfile(dest_folder_move,dst_name)
   if exist(dst_file,'file')
       fprintf('Already existed %s\n',dst_file);
   else
       %copyfile(src_file,dst_file)
       movefile(src_file,dst_file)
   end
end
cd(dest_folder_move)
% rmdir(dest_folder_rename)
%% 


%% Change back to the main current working folder
cd(File_operation_dir)
% check existence of variable
