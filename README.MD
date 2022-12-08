# Indonesia
Halo guys disini saya harap temen-temen semua sudah paham untuk apa itu Vitess sendiri, nah dikarenakan vitess tidak ada fitur untuk melakukan failover dari node / mysql yang ada pada vttablet maka saya membuat script basic ini, kalian bisa menjalankan nya dengan menggunakan crontab. 
ex.

*/1 * * * * /home/eka/vitess-13.0.0-bc4a960/examples/local/checkdbex.sh

*/1 * * * * /home/eka/vitess-13.0.0-bc4a960/examples/local/checkdbex-80.sh

seperti contoh diatas script saya jalankan persatu menit, dan ketika Master replicate mati script akan melakukan reparent dari slave / replicate menjadi master. Tetap akan ada downtime tentunya, untuk menjadi trigger dari script tersebut adalah ping. Ketika ping ke Master replicate RTO atau time out script akan menjalankan reparent.



# English

Hi guys, I hope you all understand what Vitess is. So that I get straight to the point of discussion regarding the script. Because Vitess doesn't have a failover feature, I made this basic script. You can use it by placing it in crontab. The trigger of this script itself is the ping ip on host Master replicate on keyspace down the script will do the reparenting of replicate so that it becomes the master.

*/1 * * * * /home/eka/vitess-13.0.0-bc4a960/examples/local/checkdbex.sh

*/1 * * * * /home/eka/vitess-13.0.0-bc4a960/examples/local/checkdbex-80.sh


