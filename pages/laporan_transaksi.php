<?php include "koneksi.php"; ?>
<div id="label-page"><h3>Tampil Data Transaksi</h3></div> 
<div id="content">
    <p id="tombol-tambah-container">
        <!-- <a href="index.php?p=transaksi-peminjaman-input" class="tombol">Tambah Transaksi</a>  -->
        <a target="_blank" href="pages/cetak_transaksi.php"><img src="print.png" height="50px" height="50px"></a>
        <a target="_blank" href="ekspor_pdf_transaksi.php"><img src="pdf.png" height="50px" height="50px"></a>
        <a target="_blank" href="ekspor_excel_transaksi.php"><img src="excel.png" height="50px" height="50px"></a> 
        <div class="form-inline"> 
            <div align="right"> 
                <form method=post> 
                    <input type="text" name="pencarian"> 
                    <input type="submit" name="search" value="search" class="tombol"> 
                </form> 
            </div> 
        </div>
    </p> 
    <table id="tabel-tampil"> 
        <thead> 
        <tr>
			<th id="label-tampil-no">No</td>
			<th>ID Transaksi</th>
			<th>ID Anggota</th>
			<th>Nama</th>
			<th>ID Buku</th>
			<th>Judul Buku</th>
			<th>Tanggal Pinjam</th>
			<th>Tanggal Kembali</th>
			<!-- <th id="label-opsi3">Opsi</th> -->
		</tr>
        </thead>
        <tbody>
        <?php 
                $batas = 5;
                extract($_GET); 
                if(empty($hal)) { 
                    $posisi = 0; 
                    $hal = 1; 
                    $nomor = 1; 
                }else { 
                    $posisi = ($hal - 1) * $batas; 
                    $nomor = $posisi+1; 
                }

                if($_SERVER['REQUEST_METHOD'] == "POST") { 
                    $pencarian = trim(mysqli_real_escape_string($db, $_POST['pencarian'])); 
                    if($pencarian != "") { 
                        $sql = "SELECT * FROM tbtransaksi WHERE idanggota LIKE '%$pencarian%' 
                                OR idtransaksi LIKE '%$pencarian%' 
                                OR idbuku LIKE '%$pencarian%' 
                                OR tglpinjam LIKE '%$pencarian%'"; 

                        $query = $sql; 
                        $queryJml = $sql; 

                    } else { 
                        $query = "SELECT * FROM tbtransaksi LIMIT $posisi, $batas"; 
                        $queryJml = "SELECT * FROM tbtransaksi"; 
                        $no = $posisi * 1; 
                    }
                }
                else { 
                    $query = "SELECT * FROM tbtransaksi LIMIT $posisi, $batas"; 
                    $queryJml = "SELECT * FROM tbtransaksi"; 
                    $no = $posisi * 1; 
                }

                //$sql="SELECT * FROM tbtransaksi ORDER BY idtransaksi ASC"; 
                $q_tampil_transaksi = mysqli_query($db, $query); 

                // Pengecekan apakah terdapat data di database, jika ada, tampilkan
                if(mysqli_num_rows($q_tampil_transaksi) > 0) { 

                    // looping data transaksi sesuai yang ada di database 
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
        </tbody>
    </table>
    
    <?php 
    if(isset($_POST['pencarian'])) { 
        if($_POST['pencarian']!='') { 
            echo "<div style=\"float:left;\">"; 
            $jml = mysqli_num_rows(mysqli_query($db, $queryJml)); 
            echo "Data Hasil Pencarian: <b>$jml</b>"; 
            echo "</div>"; 
        }
    } else { 
    ?> 
        <div style="float: left;"> 
        <?php 
            $jml = mysqli_num_rows(mysqli_query($db, $queryJml)); 
            echo "Jumlah Data : <b>$jml</b>"; 
        ?> 
        </div>
        <div class="pagination" style="float: right;"> 
            <?php 
                $jml_hal = ceil($jml / $batas); 
                for($i = 1; $i <= $jml_hal; $i++) { 
                    if($i != $hal) { 
                        echo "<a href=\"?p=transaksi&hal=$i\">$i</a>"; 
                    } else { 
                        echo "<a class=\"active\">$i</a>"; 
                    } 
                }
            ?>
        </div> 
    <?php 
    } 
    ?> 
</div> 
