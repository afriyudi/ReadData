youtube : https://youtu.be/c4Jgojqp8u4

# program untuk menampilkan data di flutter melalui flutlab.io  untuk akses Database MySql

 ada perubahan/perbaikan source program yang lama di folder /lib menyesuaikan dengan versi flutter, ada juga perubahan file  pubspec.yaml, perubahan environment dari
  sdk: ">=2.1.0 <3.0.0"  menjadi sdk: ">=2.12.0 <3.0.0" (perubahan untuk meng-enable library Null safety features), perubahan pada dipendencies dari http: ^0.12.2 (belum null safety)  menjadi http: ^0.13.5 (sudah null sefety)
 
#  tanggal 19 Sept 2022
- file main.dart new flutter
- file mainold.dart old source (flutter versi lama)

- folder backend berisi query mysql dan program php untuk menampilkan data mhs, ada perubahan nama file backend menjadi readDatajsonMhs.php

# program sederhana untuk menampilkan data mysql di flutter

![alt text](https://github.com/afriyudi/ReadData/blob/master/gambar/progflutter.png "jalannya program di browser")

- jalanny program dapat di lihat di  https://dartpad.dev/?id=b1e5a6b2860139b68085be82c82b0161    CLIK RUN UNTUK JALANKAN PROGRAM
- program ini mengakses database mysql di https://testflutterku.000webhostapp.com/readDatajsonMhs.php  


untuk akses database anda harus memmbuat hosting, bisa yang gratis di https://www.000webhost.com/

