# Mouse_bulk_RNA-seq
Mouse bulk RNA-seq code (mm10, GENCODE M25) running in the HMS O2 cluster

## About Mouse_bulk_RNA-seq repo

This repository contains the codes for mouse bulk RNA-seq analysis using STAR
Default reference genome is mm10 (GENCODE M25)

## Requirements

* Harvard Medical School O2 account
* [RStudio](https://posit.co/download/rstudio-desktop/)
* [FileZilla](https://filezilla-project.org/)

**How do you get an HMS O2 account?**

[How to request or retain an O2 account ("Off-Quad)](https://harvardmed.atlassian.net/wiki/spaces/O2/pages/1918304257/How+to+request+or+retain+an+O2+account#%E2%80%9COff-Quad%E2%80%9D-(HMS-affiliate-hospital/institution)-Labs:)

1. Submit the [PPMS New User Request Form](https://ppms.us/harvard-hms/vdoc/?cont=on&pf=11&docid=30)
2. Submit the [O2 account request](https://harvardmed.service-now.com/stat?id=service_catalog_cards&sys_id=5165e1dbdb209050b642f27139961979&sysparm_category=991a7f2edb890c10b642f2713996196a&sysparm_catcardid=a5051476db0d0c10b642f2713996198d)
3. Setup the environment (Instruction is [here](https://www.dropbox.com/scl/fi/ghvubyrevu8w2oqd3yr98/20210107_HMSO2Setting.docx?rlkey=kkeepe31hgu3dp2mt7lv8g6qe&dl=0))

## Basic Usage

There are three steps for using these codes.

1. Download the codes from this repository
2. Edit the codes (e.g., parameters in the header, folder/file path)
3. Submit a job to the O2 cluster

Please read the following section for a detailed explanation.

## Getting Started

### Step1: Download the codes and upload them to the HMS O2 server

**Download the codes from this repository (this web page you are seeing now)**

1. Scroll to the top of this page
2. Click the green "Code" button and then click "Download ZIP"

![1](https://github.com/hsgway/assets/blob/main/images/1.png)

3. Unzip the folder on your computer
</br>

**Upload the codes to the HMS O2 server**

1. Access [O2 Portal](https://o2portal.rc.hms.harvard.edu)
2. Click "Files" and "Home Directory"

![2](https://github.com/hsgway/assets/blob/main/images/2.png)

3. Click the blue "Upload" button

![3](https://github.com/hsgway/assets/blob/main/images/3.png)

4. Upload the files by drag and drop your unzipped folder

The size of the file/folder that can be uploaded by this method is up to 10GB. If you need to upload a larger file, please use [FileZilla](https://filezilla-project.org/) or read [this manual](https://harvardmed.atlassian.net/wiki/spaces/O2/pages/1588662157/File+Transfer#Graphical-tools).
</br>
</br>

### Step2: Edit the codes

There are two options for editing the codes. You can also use a command-line text editor (e.g. vi) if you are familiar with it.

**Option 1. Edit directly from O2 Portal**

1. Click "Files" and "Home Directory" on [O2 Portal](https://o2portal.rc.hms.harvard.edu)

![2](https://github.com/hsgway/assets/blob/main/images/2.png)

2. Click the folder you uploaded

![9](https://github.com/hsgway/assets/blob/main/images/9.png)

3. Click the three dots next to "0_setting.sh" and select "Edit"

![10](https://github.com/hsgway/assets/blob/main/images/10.png)

4. Type in your email address to receive notifications of the job status

![11](https://github.com/hsgway/assets/blob/main/images/11.png)

5. Click the blue "Save" button on the top
6. Close the window
7. Repeat these steps for all the other bash (xxx.sh) files
</br>

**Option 2. Edit using VSCode on O2 Portal**

1. Click "HMS-RC Applications" and "VSCode" on [O2 portal](https://o2portal.rc.hms.harvard.edu)

![4](https://github.com/hsgway/assets/blob/main/images/4.png)

2. Select the parameters as follows

* Slurm Account (This is not your username): Waldor_mkw5
* Partition: Priority (If you are running more than two jobs, select the others)
* WallTime requested in hours: 1 (hours, this must be changed in your future job)
* Number of cores: 1 (this must be changed in your future job)
* GPUs: blank
* GPU card type: blank
* Total memory in GB: 1 (GB, this must be changed in your future job)

*Please note that these parameters need to be modified in your future jobs submitted to O2*

3. Click the blue "Launch" button
4. Once the title bar turns green, click the blue "Launch VScode" button

![5](https://github.com/hsgway/assets/blob/main/images/5.png)

5. Click "Open file" and select the file to edit

![6](https://github.com/hsgway/assets/blob/main/images/6.png)

![7](https://github.com/hsgway/assets/blob/main/images/7.png)

6. Type in your email address to receive notifications of the job status

![8](https://github.com/hsgway/assets/blob/main/images/8.png)

7. Click "File" and "Save"
8. Close the window
9. Repeat these steps for all the other bash (xxx.sh) files
</br>

### Step3: Submit a job to the O2

1. Click "Clusters" and "_O2 Cluster Terminal" on [O2 portal](https://o2portal.rc.hms.harvard.edu)

![12](https://github.com/hsgway/assets/blob/main/images/12.png)

2. Enter your password

![13](https://github.com/hsgway/assets/blob/main/images/13.png)

3. Now you are in your login node

![14](https://github.com/hsgway/assets/blob/main/images/14.png)

4. Type in the following command after "$" mark

```
sbatch [Folder_name]/[File_name].sh
```
If your folder name is "Mouse_bulk_RNA-seq-main" and the file name is "0_setting.sh", please run the following command

```
sbatch Mouse_bulk_RNA-seq-main/0_setting.sh
```
5. Type in the following command to check in the job status
```
sacct
```

After 0_setting.sh is completed, please confirm that you successfully created the conda environment by typing these two commands
```
module load conda2/4.2.13
```
```
conda env list
```

The environment was successfully created if you see the "base" and "trimgalore"

![15](https://github.com/hsgway/assets/blob/main/images/15.png)

Now, you are ready to start RNA-seq analysis.
</br>


## Upload FASTQ files

We use FileZilla to upload FASTQ files. If you prefer command-line tools, please visit [O2 wiki](https://harvardmed.atlassian.net/wiki/spaces/O2/pages/1588662157/File+Transfer#Transfers-on-the-O2-File-Transfer-Servers) for getting instruction.

**Setup the environment before starting FileZilla (Instruction is [here](https://www.dropbox.com/scl/fi/ghvubyrevu8w2oqd3yr98/20210107_HMSO2Setting.docx?rlkey=kkeepe31hgu3dp2mt7lv8g6qe&dl=0))**

1. Open FileZilla
2. Enter the following connection parameters

* host: transfer.rc.hms.harvard.edu
* port: 22  (the SFTP port)
* username: your HMS ID (formerly known as eCommons ID), the ID you use to login to O2, in lowercase, e.g., ab123 (not your Harvard ID or Harvard Key)
* password: your HMS ID password, the password you use when logging in to O2

![16](https://github.com/hsgway/assets/blob/main/images/16.png)

3. 



