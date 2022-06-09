<?php
    require "./bd.php";
    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $mail = $_POST["mail"];
    $mdp = $_POST["password"];
    $db = new DB();
    $req = $db->db->prepare("INSERT INTO `utilisateur`(`Nom_Utilisateur`, `Prenom_Utilisateur`, `Mail_Utilisateur`,`Mdp_Utilisateur`) 
                            VALUES (?, ?, ?, sha(?))");
    $req->execute(array($nom, $prenom, $mail, $mdp));
    if($req){
        echo "true";
    }
    else{
        echo "false";
    }
    echo json_encode($tab);
?>  