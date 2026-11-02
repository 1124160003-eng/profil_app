# Profil App (Flutter)

Jadi ini project Flutter kecil-kecilan buat nampilin halaman profil (Profile Page).
Isinya masih pakai data dummy, tapi udah lumayan interaktif karena namanya bisa di-edit.

Ini urutan hal yang udah gw kerjain berdasarkan history commit:

### 1. Setup UI Dasar

- Bikin struktur awal halaman profil.
- Nampilin foto profil (Avatar) sama teks nama dan role.

### 2. Rapihin Kode (Refactor)

- Biar gak berantakan, kode gw pecah jadi beberapa custom widget terpisah (kayak `ProfileAvatar`, `ProfileInfo`, `ProfileStats`, sama `ExperienceCard`).
- Mecah UI statistik jadi widget sendiri biar gampang diatur.

### 3. Nambahin Fitur

- Nambahin barisan statistik (jumlah proyek, followers, dll).
- Bikin list riwayat pengalaman pakai `ListView.builder` biar bisa di-scroll.
- Nambahin fitur **Edit Profil**. Karena butuh update data secara dinamis, gw ubah halaman ini dari `StatelessWidget` jadi `StatefulWidget`.
- Bikin dialog (AlertDialog) buat ngedit nama, lengkap dengan tombol simpan dan batal.

### 4. Finishing & Fix

- Beresin error atau typo yang bikin kode merah.
- Ngerapihin styling biar tampilannya lebih enak dilihat.

---

**Teknis:**
Dibuat pakai Flutter. Udah nerapin State Management dasar (`setState`), Custom Widgets, sama Navigasi Dialog.
