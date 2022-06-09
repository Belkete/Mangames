<?php
    require "./bd.php";
    $mail = $_POST["mail"];
    $mdp = $_POST["password"];
    $db = new DB();
    $req = $db->db->prepare("select * from utilisateur where Mail_Utilisateur=? and Mdp_Utilisateur=sha(?)");
    $req->execute(array($mail,$mdp));
    $tab=$req->fetchAll();
    echo json_encode($tab);
?>    