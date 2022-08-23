# Copiando Arquivos e Manipulando Processos

## Copiando arquivos

Parâmetros mais úteis na cópia utilizando o "cp" para copiar arquivos.

<br>
Sintaxe básica: <br>

> cp \<origem> \<destino>

<br>
Podemos também copiar por tipo de arquivo.

>   root@ubuntu-srv-dio:/disco2# ls <br>
>   arquivo1.txt  arquivo2.txt  arquivo3.txt  arquivo4.>   txt  arquivo5.txt  lost+found <br>
>   root@ubuntu-srv-dio:/disco2# ls /home/marcio <br>
>   IMPORTANTE.txt  workspace <br>
>
>   Vamos copiar todos os arquivos .txt localizados em /disco2 para /home/marcio: <br>
>
>   root@ubuntu-srv-dio:/disco2# cp *.txt /home/marcio <br>
>   root@ubuntu-srv-dio:/disco2# ls /home/marcio <br>
>   arquivo1.txt  arquivo2.txt  arquivo3.txt  arquivo4.txt  arquivo5.txt  IMPORTANTE.txt  workspace <br>
>   root@ubuntu-srv-dio:/disco2# <br>

<br>
Copiando arquivos que inicam pela letra "a":

> root@ubuntu-srv-dio:/home/marcio# ls <br>
> arquivo1.txt  arquivo2.txt  arquivo3.txt  arquivo4.txt  > arquivo5.txt  IMPORTANTE.txt  workspace <br>
> root@ubuntu-srv-dio:/home/marcio# <br>
> <br>
> Criando mais arquivos <br>
> root@ubuntu-srv-dio:/home/marcio# touch alface.txt <br>
> root@ubuntu-srv-dio:/home/marcio# touch alfafa.txt <br>
> root@ubuntu-srv-dio:/home/marcio# touch alicate.txt <br>
> root@ubuntu-srv-dio:/home/marcio# cp ./a* /disco2/ <br>
> root@ubuntu-srv-dio:/home/marcio# ls /disco2 <br>
> alface.txt  alicate.txt   arquivo2.txt  arquivo4.txt  lost> +found <br>
> alfafa.txt  arquivo1.txt  arquivo3.txt  arquivo5.txt <br>
> root@ubuntu-srv-dio:/home/marcio# <br>

ATENÇÃO / CUIDADO: Os arquivos de mesmo nome que estavam em /home/marcio irão substituir os que estiverem em /disco2/ sem perguntar. Se os arquivos do destino fossem os mais novos teríamos perdido.

<br>
Para evitar isso, utilizamos o parâmetro -i para que o sistema pergunte se quer substituir o destino ou não.

> root@ubuntu-srv-dio:/home/marcio# cp ./* /disco2/ -i<br>
> cp: overwrite '/disco2/alface.txt'? y<br>
> cp: overwrite '/disco2/alfafa.txt'? y<br>
> cp: overwrite '/disco2/alicate.txt'? y<br>
> cp: overwrite '/disco2/arquivo1.txt'? n<br>
> cp: overwrite '/disco2/arquivo2.txt'? y<br>
> cp: overwrite '/disco2/arquivo3.txt'? n<br>
> cp: overwrite '/disco2/arquivo4.txt'? y<br>
> cp: overwrite '/disco2/arquivo5.txt'? n<br>
> cp: -r not specified; omitting directory './workspace'<br>
> root@ubuntu-srv-dio:/home/marcio#<br>

<br>
Copiar pastas e subpastas:

> root@ubuntu-srv-dio:/home/marcio# cp ./* /disco2/ **-r** <br>

<br>
Ver o andamento da cópia:

> root@ubuntu-srv-dio:/home/marcio# cp ./* /disco2/ -r **-v** <br>

<br>
neste exemplo, copiamos todos os arquivos e os subdiretórios que começam com a letra "s" <br>

> root@ubuntu-srv-dio:/etc# cp /etc/s* /disco2/backup/ -r -v

> root@ubuntu-srv-dio:/etc# ls /disco2/backup/ <br>
> screenrc  security  selinux  services  shadow  shadow-  shells  skel  sos  ssh  ssl  subgid  subgid-  subuid  subuid-  sudo.conf  sudoers  sudoers.d  sudo_logsrvd.conf  sysctl.conf  sysctl.d  systemd <br>
> root@ubuntu-srv-dio:/etc# <br>

<br>

## Renomeando Movendo arquivos
<br>
Demonstrando o mover arquivos, o ctrl+x, ctrl+v do Linux:

> root@ubuntu-srv-dio:/home/marcio# ls <br>
> alface.txt  alicate.txt   arquivo2.txt  arquivo4.txt  IMPORTANTE.txt <br>
> alfafa.txt  arquivo1.txt  arquivo3.txt  arquivo5.txt  workspace <br>
> > Vamos criar o arquivo **planilhas.xlsx** para teste. <br>
> > root@ubuntu-srv-dio:/home/marcio# touch planilhas.xlsx <br>
> > root@ubuntu-srv-dio:/home/marcio# ls <br>
> > alface.txt  alicate.txt   arquivo2.txt  arquivo4.txt  IMPORTANTE.txt  workspace <br>
> > alfafa.txt  arquivo1.txt  arquivo3.txt  arquivo5.txt  **planilhas.xlsx** <br>
> 
> Movendo o arquivo: <br>
> root@ubuntu-srv-dio:/home/marcio# mv /home/marcio/planilhas.xlsx /disco2/ <br>
> root@ubuntu-srv-dio:/home/marcio# ls <br>
> alface.txt  alicate.txt   arquivo2.txt  arquivo4.txt  IMPORTANTE.txt <br>
> alfafa.txt  arquivo1.txt  arquivo3.txt  arquivo5.txt  workspace <br>
> > Arquivo movido com sucesso: <br>
> > root@ubuntu-srv-dio:/home/marcio# ls /disco2 <br>
> > alface.txt  alicate.txt   arquivo2.txt  arquivo4.txt  backup          lost+found <br>
> > alfafa.txt  arquivo1.txt  arquivo3.txt  arquivo5.txt  IMPORTANTE.txt  **planilhas.xlsx** <br>
> > root@ubuntu-srv-dio:/home/marcio# <br>

<br>
O comando "mv" também pode ser usado para renomerar os arquivos.

> root@ubuntu-srv-dio:/home/marcio# ls <br>
> alface.txt  alicate.txt   arquivo2.txt  arquivo4.txt  IMPORTANTE.txt <br>
> alfafa.txt  **arquivo1.txt**  arquivo3.txt  arquivo5.txt  workspace <br>
> root@ubuntu-srv-dio:/home/marcio# <br>
> root@ubuntu-srv-dio:/home/marcio# <br>
> root@ubuntu-srv-dio:/home/marcio# mv arquivo1.txt > arquivo_01.txt <br>
> root@ubuntu-srv-dio:/home/marcio# ls <br>
> alface.txt  alicate.txt     arquivo2.txt  arquivo4.txt  IMPORTANTE.txt <br>
> alfafa.txt  **arquivo_01.txt**  arquivo3.txt  arquivo5.txt  workspace <br>
> root@ubuntu-srv-dio:/home/marcio# <br>

<br>

## Iniciando, visualizando e encerrando um processo

<br>
Vendo os usuários logados:

> root@ubuntu-srv-dio:/home/marcio# w <br>
>  19:14:06 up  1:38,  2 users,  load average: 0,06, 0,08, 0,08 <br>
> USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT <br>
> root     pts/0    192.168.20.100   17:49    6.00s  1.10s  0.00s w <br>
> marcio   pts/1    192.168.20.100   19:13   14.00s  0.06s  0.06s -bash <br>
> root@ubuntu-srv-dio:/home/marcio# who -a <br>
>            system boot  2022-08-20 17:35 <br>
> LOGIN      tty1         2022-08-20 17:35               971 id=tty1 <br>
>            run-level 5  2022-08-20 17:35 <br>
> root     - pts/0        2022-08-20 17:49   .          1361 (192.168.20.100) <br>
> marcio   + pts/1        2022-08-20 19:13 00:01       31403 (192.168.20.100) <br>
> root@ubuntu-srv-dio:/home/marcio# <br>
> > Após verificar o PID do usuário logado indevidamente, encerramos o processo dele: <br>
> > root@ubuntu-srv-dio:/home/marcio# kill 31403 <br>
> > root@ubuntu-srv-dio:/home/marcio# <br>

<br>
Para o usuário marcio aparecerá:

> marcio@ubuntu-srv-dio:~$ <br>
> Remote side unexpectedly closed network connection <br>

<br>
Da mesma forma que finalizamos o login do usuário, podemos encerrar processos de aplicativos de duas formas, pelo PID e pelo nome. Vamos ver a lista de processos em atividade:

> marcio@marcio-vm:/# ps aux <br>
> USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND <br>
> root           3  0.0  0.0      0     0 ?        I<   19:07   0:00 [rcu_gp] <br>
> root        3212  0.0  0.0      0     0 ?        I    19:22   0:00 [kworker/2:0-events] <br>
> marcio      3222  6.8  9.3 34232636 185996 ?     SLl  19:26   0:03 /opt/google/chrome/chrome --enable-crashpad <br>
> marcio      3227  0.0  0.0   8236   576 ?        S    19:26   0:00 cat <br>
> marcio      3228  0.0  0.0   8236   580 ?        S    19:26   0:00 cat <br>
> marcio      3230  0.0  0.1 33577092 2924 ?       Sl   19:26   0:00 /opt/google/chrome/chrome_crashpad_handler --monitor-self --monitor-self-annotation=ptype <br>
> marcio      3232  0.0  0.0 33567856 1304 ?       Sl   19:26   0:00 /opt/google/chrome/chrome_crashpad_handler --no-periodic-tasks --monitor-self-annotation= <br>
> marcio      3238  0.1  2.8 33839728 56992 ?      S    19:26   0:00 /opt/google/chrome/chrome --type=zygote --no-zygote-sandbox --enable-crashpad --crashpad- <br>
> marcio      3239  0.1  2.8 33839724 57292 ?      S    19:26   0:00 /opt/google/chrome/chrome --type=zygote --enable-crashpad --crashpad-handler-pid=3230 --e <br>
> marcio      3240  0.0  0.2 33563444 4008 ?       S    19:26   0:00 /opt/google/chrome/nacl_helper <br>
> marcio      3243  0.0  0.7 33839748 15780 ?      S    19:26   0:00 /opt/google/chrome/chrome --type=zygote --enable-crashpad --crashpad-handler-pid=3230 --e <br>
> marcio      3262  2.6  5.6 34095356 112288 ?     Sl   19:26   0:01 /opt/google/chrome/chrome --type=gpu-process --enable-crashpad --crashpad-handler-pid=323 <br>
> marcio      3289  0.2  1.9 33881128 38660 ?      Sl   19:26   0:00 /opt/google/chrome/chrome --type=utility --utility-sub-type=storage.mojom.StorageService  <br>
> marcio      3307  1.6  5.0 1179506216 100832 ?   Sl   19:26   0:00 /opt/google/chrome/chrome --type=renderer --enable-crashpad --crashpad-handler-pid=3230 - <br>
> marcio      3313  4.0  5.8 1179513084 116792 ?   Sl   19:26   0:01 /opt/google/chrome/chrome --type=renderer --enable-crashpad --crashpad-handler-pid=3230 - <br>
> marcio      3438  1.0  4.6 33886072 93448 ?      Sl   19:26   0:00 /opt/google/chrome/chrome --type=utility --utility-sub-type=network.mojom.NetworkService  <br>
> marcio      3447  0.1  3.0 1179505140 61576 ?    Sl   19:26   0:00 /opt/google/chrome/chrome --type=renderer --enable-crashpad --crashpad-handler-pid=3230 - <br>
> marcio      3501  0.0  0.1  11592  3324 pts/0    R+   19:26   0:00 ps aux <br>
> marcio@marcio-vm:~$

<br>
O Chrome tem diversos processos, não temos como saber qual o PID do processo principal, sendo assim: <br>

> marcio@marcio-vm:~$ killall chrome

<br>
Para eliminar o processo do Firefox, podemos usar o PID:

> marcio      2762 60.3 15.6 3376016 310568 ?      Sl   19:10   0:10 /usr/lib/firefox/firefox -new-window <br>
> marcio@marcio-vm:~$ kill 2762

