# Gerenciamento de Discos Linux

## Discos, sistemas de arquivos e partições

Tipos de tecnologias de discos: <br>
HDD: hard drive disk <br>
SSD: Solid State Disk <br>
NVMe: Non-Volatile Memory Express <br>

<p>
Sistema de arquivos: É a forma ou padrão como o sistema operacional irá controlar como os dados serão armazenados nos discos.</p>

| Sistema Operacional | Sistema de arquivos |
| ------------------: | :------------------ |
|               MacOS | HFS                 |
|          Unix/Linux | Ext3, Ext4, XFS     |
|             Windows | FAT32, NTFS         |

### Particionamento

Divisão de um disco em partes, cada partição pode ter um sistema de arquivos diferente.

### Partições no Windows

Cada partição é reconhecida como uma unidade de disco independente.

### Partições no Linux

No Linux, cada disco recebe um nome iniciado por *sd*: <br>
sda, sdb, sdc

<br>
Cada partição será numerada da seguinte forma:<br>
sda1, sda2, sdb1, sdb2 <br>

> root@ubuntu-srv-dio:/# lsblk <br>
> 
> |NAME                      |MAJ:MIN | RM |  SIZE | RO| TYPE | MOUNTPOINTS       |
> |:---                      |:---:   |:---:|---:  |:---:|:---:|:---         |             
> |loop0                     |  7:0   |  0 |   62M | 1 | loop | /snap/core20/1593 |
> |loop1                     |  7:1   |  0 |   62M | 1 | loop | /snap/core20/1611 |
> |loop2                     |  7:2   |  0 | 79,9M | 1 | loop | /snap/lxd/22923   |
> |loop3                     |  7:3   |  0 | 44,7M | 1 | loop | /snap/snapd/15534 |
> |loop4                     |  7:4   |  0 |   47M | 1 | loop | /snap/snapd/16292 |
> |sda                       |  8:0   |  0 |   60G | 0 | disk |                   |
> |├─sda1                    |  8:1   |  0 |    1M | 0 | part |                   |
> |├─sda2                    |  8:2   |  0 |    2G | 0 | part | /boot             |
> |└─sda3                    |  8:3   |  0 |   58G | 0 | part |                   |
> |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ubuntu--vg-ubuntu--lv |253:0   |  0 |   29G | 0 | > lvm  | /                 |
> |sdb                       |  8:16  |  0 |   60G | 0 | disk | /disco2           |
> |sr0                       | 11:0   |  1 | 1024M | 0 | rom  |                   |
> 
> root@ubuntu-srv-dio:/#


<br>

## Adicionando um novo disco
<br>
Como já vimos anteriormente, para visualizar discos e partições:

> marcio@ubuntu-srv-dio:~$ lsblk

<br>
ou

> root@ubuntu-srv-dio:/# fdisk -l <br>
> Disk /dev/sda: 60 GiB, 64424509440 bytes, 125829120 sectors <br>
> Disk model: VMware Virtual S <br>
> Units: sectors of 1 * 512 = 512 bytes <br>
> Sector size (logical/physical): 512 bytes / 512 bytes <br>
> I/O size (minimum/optimal): 512 bytes / 512 bytes <br>
> Disklabel type: gpt <br>
> Disk identifier: DE03757C-BDA1-4BC9-AEAB-3CC28197C115 <br>
> 
> Device  Start End Sectors Size Type <br>
> /dev/sda1  2048 4095      2048   1M BIOS boot <br>
> /dev/sda2  4096 4198399   4194304   2G Linux filesystem <br>
> /dev/sda3  4198400  125827071 121628672  58G Linux filesystem <br>
> 
> Disk /dev/mapper/ubuntu--vg-ubuntu--lv: 29 GiB, 31134318592 bytes, 60809216 sectors <br>
> Units: sectors of 1 * 512 = 512 bytes <br>
> Sector size (logical/physical): 512 bytes / 512 bytes <br>
> I/O size (minimum/optimal): 512 bytes / 512 bytes <br>
> root@ubuntu-srv-dio:/# <br>

<br>
Após adicionar um novo disco, podemos ver :

> root@ubuntu-srv-dio:/# lsblk <br>
> NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS <br>
> loop0                       7:0    0   62M  1 loop /snap/core20/1611 <br>
> loop1                       7:1    0   62M  1 loop /snap/core20/1593 <br>
> loop2                       7:2    0 79,9M  1 loop /snap/lxd/22923 <br>
> loop3                       7:3    0 44,7M  1 loop /snap/snapd/15534 <br>
> loop4                       7:4    0   47M  1 loop /snap/snapd/16292 <br>
> sda                         8:0    0   60G  0 disk <br>
> ├─sda1                      8:1    0    1M  0 part <br>
> ├─sda2                      8:2    0    2G  0 part /boot <br>
> └─sda3                      8:3    0   58G  0 part <br>
>   └─ubuntu--vg-ubuntu--lv 253:0    0   29G  0 lvm  / <br>
> sdb                         8:16   0   60G  0 disk  <<<<<< <br>
> sr0                        11:0    1 1024M  0 rom <br>
> root@ubuntu-srv-dio:/# <br>

<br>
Ou

> root@ubuntu-srv-dio:/# fdisk -l<br>
> Disk /dev/sdb: 60 GiB, 64424509440 bytes, 125829120 sectors<br>
> Disk model: VMware Virtual S<br>
> Units: sectors of 1 * 512 = 512 bytes<br>
> Sector size (logical/physical): 512 bytes / 512 bytes<br>
> I/O size (minimum/optimal): 512 bytes / 512 bytes<br>
> 
> Disk /dev/sda: 60 GiB, 64424509440 bytes, 125829120 sectors<br>
> Disk model: VMware Virtual S<br>
> Units: sectors of 1 * 512 = 512 bytes<br>
> Sector size (logical/physical): 512 bytes / 512 bytes<br>
> I/O size (minimum/optimal): 512 bytes / 512 bytes<br>
> Disklabel type: gpt<br>
> Disk identifier: DE03757C-BDA1-4BC9-AEAB-3CC28197C115<br>
> 
> Device       Start       End   Sectors Size Type<br>
> /dev/sda1     2048      4095      2048   1M BIOS boot<br>
> /dev/sda2     4096   4198399   4194304   2G Linux filesystem<br>
> /dev/sda3  4198400 125827071 121628672  58G Linux filesystem<br>
> 
> Disk /dev/mapper/ubuntu--vg-ubuntu--lv: 29 GiB, 31134318592 bytes, 60809216 sectors<br>
> Units: sectors of 1 * 512 = 512 bytes<br>
> Sector size (logical/physical): 512 bytes / 512 bytes<br>
> I/O size (minimum/optimal): 512 bytes / 512 bytes<br>
> root@ubuntu-srv-dio:/#<br>

<br>

## Particionando e formatando discos via terminal

<br>

Vamos realizar o particionamento do novo disco sdb adicionado com o **fdisk**.

> root@ubuntu-srv-dio:/# fdisk /dev/sdb
> 
> Welcome to fdisk (util-linux 2.37.2).
> Changes will remain in memory only, until you decide to write them.
> Be careful before using the write command.
> 
> Device does not contain a recognized partition table.
> Created a new DOS disklabel with disk identifier 0xba7bdd2c.
> 
> Command (m for help): m
> 
> Help:
> 
>   DOS (MBR) <br>
>    a   toggle a bootable flag <br>
>    b   edit nested BSD disklabel <br>
>    c   toggle the dos compatibility flag <br>
> 
>   Generic <br>
>    d   delete a partition <br>
>    F   list free unpartitioned space <br>
>    l   list known partition types <br>
>    **n   add a new partition** <br>
>    p   print the partition table <br>
>    t   change a partition type <br>
>    v   verify the partition table <br>
>    i   print information about a partition <br>
> 
>   Misc <br>
>    m   print this menu <br>
>    u   change display/entry units <br>
>    x   extra functionality (experts only) <br>
> 
>   Script <br>
>    I   load disk layout from sfdisk script file <br>
>    O   dump disk layout to sfdisk script file <br>
> 
>   Save & Exit <br>
>    w   write table to disk and exit <br>
>    q   quit without saving changes <br>
> 
>   Create a new label <br>
>    g   create a new empty GPT partition table <br>
>    G   create a new empty SGI (IRIX) partition table <br>
>    o   create a new empty DOS partition table <br>
>    s   create a new empty Sun partition table <br>
> 
> Command (m for help): n <br>
> Partition type <br>
>    p   primary (0 primary, 0 extended, 4 free) <br>
>    e   extended (container for logical partitions) <br>
> Select (default p): p <br>
> Partition number (1-4, default 1): 1 <br>
> First sector (2048-125829119, default 2048): <br>
> Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-125829119, default 125829119): <br>
> 
> Created a new partition 1 of type 'Linux' and of size 60 GiB. <br>
> 
> Command (m for help): w <br>
> The partition table has been altered. <br>
> Calling ioctl() to re-read partition table. <br>
> Syncing disks. <br>
> 
> root@ubuntu-srv-dio:/#

--------------------------------------------------

Ainda falta formatar o disco, vamos lá: <br>
Vamos usar o mkfs <br>

> root@ubuntu-srv-dio:/# mkfs --help
> 
> Usage: <br>
>  mkfs [options] [-t <type>] [fs-options] <device> [<size>]
> 
> Make a Linux filesystem.
> 
> Options: <br>
>  -t, --type=<type>  filesystem type; when unspecified, ext2 is used <br>
>      fs-options     parameters for the real filesystem builder <br>
>      <device>       path to the device to be used <br>
>      <size>         number of blocks to be used on the device <br>
>  -V, --verbose      explain what is being done; <br>
>                       specifying -V more than once will cause a dry-run <br>
>  -h, --help         display this help <br>
>  -V, --version      display version <br>
> 
> For more details see mkfs(8). <br>
> root@ubuntu-srv-dio:/#

 <br>
ATENÇÃO AQUI, PEDIU TÁ PEDIDO, NÃO PODE FICAR ARREPENDIDO, ESCOLHEU DISCO ERRADO JÁ ERA, PASSA NO RH.

> root@ubuntu-srv-dio:/# mkfs.ext4 /dev/sdb <br>
> mke2fs 1.46.5 (30-Dec-2021) <br>
> Found a dos partition table in /dev/sdb <br>
> Proceed anyway? (y,N) y <br>
> Creating filesystem with 15728640 4k blocks and 3932160 inodes <br>
> Filesystem UUID: 49737d71-4d06-4e88-b3e3-bfc6ad22c3c6 <br>
> Superblock backups stored on blocks: <br>
>         32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, <br>
>         4096000, 7962624, 11239424 <br>
> 
> Allocating group tables: done <br>
> Writing inode tables: done <br>
> Creating journal (65536 blocks): done <br>
> Writing superblocks and filesystem accounting information: done <br>
> 
> root@ubuntu-srv-dio:/#

<br>

## Montando e desmontando discos

OK, criamos a partição e formatamos o disco, mas ele ainda não está disponível para uso??? <br>
Para disponibilizar o disco para uso, precisamos montá-lo em um destino/diretório específico para montar discos. O diretório comum para isso é o /mnt/

> root@ubuntu-srv-dio:/# cd /mnt <br>
> root@ubuntu-srv-dio:/mnt# mkdir disco2 <br>
> root@ubuntu-srv-dio:/mnt# ls <br>
> disco2 <br>
> root@ubuntu-srv-dio:/mnt# mount /dev/sdb /mnt/disco2/ <br>
> root@ubuntu-srv-dio:/mnt# <br>

 <br>
Pronto, agora temos acesso a partição crida no disco sdb e podemos gravar dados nela.

> root@ubuntu-srv-dio:/mnt# cd disco2/ <br>
> root@ubuntu-srv-dio:/mnt/disco2# ls -l <br>
> total 16 <br>
> drwx------ 2 root root 16384 ago 20 12:19 lost+found <br>
> root@ubuntu-srv-dio:/mnt/disco2# touch arquivo1.txt <br>
> root@ubuntu-srv-dio:/mnt/disco2# touch arquivo2.txt <br>
> root@ubuntu-srv-dio:/mnt/disco2# <br>

 <br>
Se necessário fazer a desmontagem:

> root@ubuntu-srv-dio:/# umount /dev/sdb

OBS: Desmontar a unidade não apaga os arquivos, apenas remove o acesso a ela.

 <br>
Podemos apontar a partição para um diretório diferente para acessá-lo

> root@ubuntu-srv-dio:/# mkdir /disco2/ ; mount /dev/sdb /disco2/ <br>
> root@ubuntu-srv-dio:/# cd /disco2 <br>
> root@ubuntu-srv-dio:/disco2# ls <br>
> arquivo1.txt  arquivo2.txt  lost+found <br>
> root@ubuntu-srv-dio:/disco2# <br>

<br>

## Montando discos automaticamente

Quando criamos o ponto de montagem manualmente, caso o servidor reinicie, este ponto de montagem será perdido; para fazer com que o ponto de montagem carregue na inicialização precisamos configurá-lo no arquivo fstab:

root@ubuntu-srv-dio:/# nano /etc/fstab

>	\-------------------------------------------------- <br>
>	\# /etc/fstab: static file system information. <br>
>	\# <br>
>	\# Use 'blkid' to print the universally unique identifier for a <br>
>	\# device; this may be used with UUID= as a more robust way to name devices <br>
>	\# that works even if disks are added and removed. See fstab(5). <br>
>	\# <br>
>	\# \<file system> \<mount point>   \<type>  \<options>       \<dump>  \<pass> <br>
>	\# / was on /dev/ubuntu-vg/ubuntu-lv during curtin installation <br>
>	/dev/disk/by-id/dm-uuid-LVM-AvCxQVfyd9AwFTn45WTW4tcmXYXvITT9XIW7q8xBvDDN3rfn6rq3G0zcTZe7pbzU / ext4 defau> <br>
>	\# /boot was on /dev/sda2 during curtin installation <br>
>	/dev/disk/by-uuid/a029a3db-6690-4657-8d18-6002d7b9e8ba /boot ext4 defaults 0 1 <br>
>	/swap.img       none    swap    sw      0       0 <br>
>	
>	/dev/sdb /disco2 ext4 defaults 0 0 <<<<<<<<<<<<<<<<< adiciona assim <br>
>	\--------------------------------------------------

Salva e reinicia.

Pronto, o ponto de montagem será carregado na inicialização.
