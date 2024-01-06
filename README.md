# Mouse_bulk_RNA-seq
Mouse bulk RNA-seq code (mm10, GENCODE M25) running in the HMS O2 cluster

## About Mouse_bulk_RNA-seq repo

This repository contains the codes for mouse bulk RNA-seq analysis using STAR
Default reference genome is mm10 (GENCODE M25)

## Requirements

* Mac OS
* Harvard Medical School O2 account
* [RStudio](https://posit.co/download/rstudio-desktop/)

**How do you get an HMS O2 account?**

[How to request or retain an O2 account ("Off-Quad)](https://harvardmed.atlassian.net/wiki/spaces/O2/pages/1918304257/How+to+request+or+retain+an+O2+account#%E2%80%9COff-Quad%E2%80%9D-(HMS-affiliate-hospital/institution)-Labs:)

1. Submit the [PPMS New User Request Form](https://ppms.us/harvard-hms/vdoc/?cont=on&pf=11&docid=30)
2. Submit the [O2 account request](https://harvardmed.service-now.com/stat?id=service_catalog_cards&sys_id=5165e1dbdb209050b642f27139961979&sysparm_category=991a7f2edb890c10b642f2713996196a&sysparm_catcardid=a5051476db0d0c10b642f2713996198d)
3. Setup the environment (Instruction is [here](https://www.dropbox.com/scl/fi/ghvubyrevu8w2oqd3yr98/20210107_HMSO2Setting.docx?rlkey=kkeepe31hgu3dp2mt7lv8g6qe&dl=0))

## Getting Started

### Download the codes and upload them to the HMS O2 server

**Download the codes from this repository (this web page you are looking at)**

1. Scroll to the top
2. Click the green "Code" button and click "Download ZIP"
3. Unzip the folder

**Upload the codes to the HMS O2 server**

1. Access to the [O2 portal](https://o2portal.rc.hms.harvard.edu)
2. Click "Files" and "Home Directory"
3. Click the blue "Upload" button
4. Drag and drop your unzipped folder

The size of the file/folder that can be uploaded by this method is up to 10GB. If you need to upload larger file please use [FileZilla](https://filezilla-project.org/) or read [this manual](https://harvardmed.atlassian.net/wiki/spaces/O2/pages/1588662157/File+Transfer#Graphical-tools).

### Edit the codes through VScode app on O2

1. Access to the [O2 portal](https://o2portal.rc.hms.harvard.edu)
2. Click "HMS-RC Applications" and "VSCode"
3. Select the parameters as follows

   Slurm Account (This is not your username): Waldor_mkw5
   
   Partition: Priority (If you are running more than 2 jobs, select the others)
   
   WallTime requested in hours: 

Open each "xxx.sh" file with a text editor and change the email address to yours


First, open the terminal in your PC and login to your HMS O2 account by typing the following command.
```
ssh <yourID(e.g. ab123)>@o2.hms.harvard.edu
```
You will be prompted to enter your password.

Once you successfully login to your account, you are in login node.

Type in the following command

```
sbatch 0_setting.sh
```


