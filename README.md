### Tugas 7

1. *Apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget?*

   Widget tree adalah struktur hierarki berbentuk pohon yang merepresentasikan seluruh elemen antarmuka pengguna (UI) dalam aplikasi Flutter. Setiap komponen di layar—mulai dari teks, tombol, tata letak, hingga tema aplikasi—adalah sebuah widget yang tersusun secara bertingkat.

   Dalam hubungan induk-anak (parent-child), widget induk (parent) berfungsi mengatur tata letak, ukuran, posisi, batasan (constraints), maupun gaya tema bagi widget di dalamnya. Widget anak (child untuk satu turunan, atau children untuk banyak turunan) ditempatkan di dalam properti milik induknya dan akan merender tampilannya mengikuti aturan serta ruang yang diberikan oleh induk tersebut.

2. *Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!*

   * MaterialApp: Widget akar (root) yang membungkus seluruh aplikasi untuk menyediakan konfigurasi dasar seperti tema warna (ThemeData), judul aplikasi, navigasi, dan komponen berbasis Material Design.
   * Scaffold: Menyediakan kerangka tata letak standar halaman Material Design, seperti area untuk AppBar dan body.
   * AppBar: Menampilkan bilah navigasi di bagian atas halaman beserta judul halaman.
   * Padding: Memberikan jarak atau ruang kosong (padding) di sekeliling widget anaknya agar elemen tidak menempel langsung ke tepi layar.
   * Column: Menyusun beberapa widget anak secara vertikal (dari atas ke bawah).
   * Row: Menyusun beberapa widget anak secara horizontal (dari kiri ke kanan).
   * SizedBox: Membuat kotak kosong dengan lebar atau tinggi tertentu yang berfungsi sebagai jarak pemisah antar-widget.
   * Center: Memposisikan widget anaknya tepat di tengah-tengah ruang yang tersedia.
   * Text: Menampilkan tulisan atau string teks di layar dengan gaya huruf tertentu.
   * Card: Menampilkan wadah berbentuk kartu dengan sudut membulat dan efek bayangan (elevation) untuk memuat informasi profil (InfoCard).
   * Container: Wadah serbaguna untuk mengatur ukuran, padding, perataan, maupun dekorasi dari widget di dalamnya.
   * GridView.count: Menyusun widget anak dalam bentuk tata letak kisi (grid) dengan jumlah kolom yang tetap.
   * Material: Memberikan permukaan visual berbasis Material Design, seperti warna latar belakang kartu tombol (ItemCard) dan sudut melengkung (borderRadius).
   * InkWell: Membuat area widget menjadi interaktif sehingga dapat merespons sentuhan pengguna (onTap) dan memunculkan efek riak air (ripple effect).
   * Icon: Menampilkan ikon grafis bawaan dari pustaka Material Icons.
   * ScaffoldMessenger & SnackBar: Menampilkan pesan notifikasi sementara di bagian bawah layar ketika pengguna menekan salah satu tombol aksi.

3. *Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!*

   MaterialApp berfungsi sebagai pembungkus utama yang mengonfigurasi berbagai kebutuhan dasar aplikasi berbasis desain Material (sistem desain dari Google), seperti pengaturan tema global (ThemeData), manajemen rute halaman (routing), lokalisasi bahasa, serta penampil banner debug.

   Widget ini umumnya dijadikan root widget (akar paling atas) karena widget-widget turunan di bawahnya—seperti Scaffold, AppBar, Text, dan Theme.of(context)—membutuhkan konteks tema, arah teks (directionality), dan sistem navigasi yang disediakan oleh MaterialApp agar dapat berjalan tanpa menimbulkan galat (error).

4. *Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?*

   * StatelessWidget: Widget yang bersifat statis (immutable), artinya tampilan dan propertinya tidak akan berubah setelah pertama kali dibangun, kecuali ada data baru yang dikirim dari widget induknya.
   * StatefulWidget: Widget yang bersifat dinamis (mutable) karena memiliki objek State terpisah yang menyimpan data yang dapat berubah selama aplikasi berjalan. Ketika data di dalam State diubah melalui fungsi setState(), widget akan dirender ulang untuk memperbarui tampilannya.

   Kapan menggunakannya:
   * StatelessWidget untuk elemen antarmuka yang murni hanya menampilkan informasi tetap tanpa perlu mengubah tampilannya sendiri saat berinteraksi dengan pengguna (contohnya kartu profil InfoCard, ikon, atau halaman utama statis MyHomePage).
   * StatefulWidget ketika antarmuka perlu berubah secara dinamis merespons interaksi pengguna atau perubahan data secara real-time (contohnya formulir input, penghitung angka/counter, kotak centang, atau halaman yang memuat data dari API).

5. *Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?*

   BuildContext adalah objek penanda lokasi atau referensi posisi sebuah widget di dalam struktur widget tree. Setiap widget memiliki BuildContext-nya masing-masing yang diserahkan sebagai parameter pada metode Widget build(BuildContext context).

   BuildContext sangat penting karena menjadi jembatan bagi suatu widget untuk berkomunikasi atau mencari informasi dari widget leluhur (ancestor) yang berada di atasnya dalam widget tree. Di dalam metode build, BuildContext digunakan untuk mengakses konfigurasi global maupun layanan layar terdekat, misalnya:
   * Mengambil warna tema aplikasi menggunakan Theme.of(context).
   * Menampilkan notifikasi SnackBar pada layar aktif menggunakan ScaffoldMessenger.of(context).
   * Berpindah halaman menggunakan Navigator.of(context).

6. *Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?*

   * Hot Reload: Fitur yang menyuntikkan kode sumber yang baru diubah langsung ke dalam Dart Virtual Machine (VM) yang sedang berjalan. Prosesnya sangat cepat (kurang dari satu detik) dan mempertahankan keadaan (state) aplikasi saat ini tanpa mengulang aplikasi dari awal.
   * Hot Restart: Memuat ulang seluruh kode aplikasi ke dalam Dart VM dan mereset seluruh state aplikasi kembali ke kondisi awal (menjalankan ulang fungsi main()), namun tanpa mengompilasi ulang kode native (Android/iOS).

   Kapan tidak bisa mengandalkan Hot Reload:
   * Harus melakukan Hot Restart ketika mengubah inisialisasi nilai awal di dalam State, mengubah variabel global atau properti static, mengubah fungsi main(), atau mengubah struktur kelas dari StatelessWidget menjadi StatefulWidget (atau sebaliknya).
   * Harus melakukan Full Restart (menghentikan dan menjalankan ulang aplikasi secara penuh) ketika menambahkan pustaka/dependensi baru pada berkas pubspec.yaml, menambahkan aset gambar atau font baru, atau mengubah kode konfigurasi sisi native (seperti berkas di dalam folder android/ atau ios/).
