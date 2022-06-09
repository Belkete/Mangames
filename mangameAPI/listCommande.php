<?php
    require "./bd.php";
    $db = new DB();
    $req = $db->db->prepare("select * from commande");
    $req->execute();
    $lignes = [];
    while($ligne = $req->fetch()){
        $lignes[] = $ligne;
    }
    echo json_encode($lignes);
?>   