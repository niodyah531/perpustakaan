<?php 
    include "../koneksi.php"; // menyisipkan atau memanggil file koneksi.php untuk koneksi data dengan basis data 
?> 
<link rel="stylesheet" type="text/css" href="../style.css"> 
<h3>Data Transaksi</h3> 
<div id="content"> 
    <table border="1" id="tabel-tampil">
        <thead> 
            <tr> 
                <th id="label-tampil-no">No</th> 
                <th>ID Transaksi</th> 
                <th>ID Anggota</th>
                <th>Nama</th>
                <th>ID Buku</th>
                <th>Judul Buku</th>
                <th>Tanggal Pinjam</th>
                <th>Tanggal Kembali</th> 
            </tr> 
        </thead> 
        <tbody> 
            <?php 
                $nomor = 1; 
                $query = "SELECT * FROM tbtransaksi ORDER BY idtransaksi DESC"; 
                $q_tampil_transaksi = mysqli_query($db, $query); 

                /* Pengecekan apakah terdapat data di database, jika ada, tampilkan*/ 
                if(mysqli_num_rows($q_tampil_transaksi) > 0) { 

                    /* looping data transaksi sesuai yang ada di database */
                    while($r_tampil_transaksi=mysqli_fetch_array($q_tampil_transaksi)) {
            ?>
            <?php 
                        $nomor++;  
                    }   // selesai looping while 
                } 
                else { 
                    echo "<tr><td colspan=6>Data Tidak Ditemukan</td></tr>"; 
                }
            ?>  
		<?php
		$sql = mysqli_query($db,
			"SELECT tbtransaksi.* ,tbanggota.* ,tbbuku.*
			FROM tbtransaksi, tbanggota, tbbuku
			WHERE tbtransaksi.idanggota = tbanggota.idanggota
			AND tbtransaksi.idbuku = tbbuku.idbuku
			AND tbtransaksi.tglkembali = '0000-00-00'
			ORDER BY tbtransaksi.idtransaksi ASC"
		);
		$nomor = 1;
		foreach ($sql as $value){
		?>
		<tr>
			<td><?php echo $nomor++; ?></td>
			<td><?php echo $value['idtransaksi']; ?></td>
			<td><?php echo $value['idanggota']; ?></td>
			<td><?php echo $value['nama']; ?></td>
			<td><?php echo $value['idbuku']; ?></td>
			<td><?php echo $value['judul']; ?></td>
			<td><?php echo $value['tglpinjam']; ?></td>
			<td><?php echo $value['tglkembali']; ?></td>
		</tr>
		<?php } ?> 
    </table> 
    <script> 
        window.print(); 
    </script> 
</div> 

