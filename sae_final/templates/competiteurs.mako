<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Snipers's Den</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <!--<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>-->
        <!-- Google fonts-->
        <!--<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />-->
        <!--<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />-->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/popupstyle.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="http://localhost:8080">HOME</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="http://localhost:8080/competitions">competitions a venir</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:8080/competiteurs">s'inscrire</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:8080/store">store</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        <h1 class="mx-auto my-0 text-uppercase">Snipers's Den</h1>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5">Bienvenue sur mon appli web consacrée au tir de competition</h2>
                        <a class="btn btn-primary" href="#inscription">s'inscrire en tant que participant</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- Projects-->
        <section class="projects-section bg-light">
            <div class="container px-4 px-lg-5">
                <!-- Featured Project Row-->
                <div class="row gx-0 mb-4 mb-lg-5 align-items-center" id="inscription">
                    <div class="col-xl-8 col-lg-7"><img class="img-fluid mb-3 mb-lg-0" src="assets/img/bg-masthead.jpg" alt="..." /></div>
                    <div class="col-xl-4 col-lg-5">
                        <div class="featured-text text-center text-lg-left">
                            <h4>s'inscrire</h4>
                            <p class="text-black-50 mb-0">Il est nécessaire, avant de s'inscrire, d'avoir un numéro de licence FFTir en cours de validité ainsi que le nom de la compétition à laquelle vous souhaitez vous inscrire.</p>
                            <button class="btn btn-primary" onclick="showPopupsee()">competitions à venir</button>
                            <div id="popupsee" style="display:none">
                                <ul>
                                    % for competition in informations:
                                        <li><strong>Nom:</strong> ${competition['nom']}</li>
                                        <li><strong>Date:</strong> ${competition['date']}</li>
                                        <li><strong>Lieu:</strong> ${competition['lieu']}</li>
                                        <br>
                                    % endfor
                                </ul>
                            </div>
                            <div class="popupsee" id="popupsee">
                                <h2 class="popup-title">Competitions à venir:</h2>
                                <div class="popup-content" id="popup-content"></div>
                                <button onclick="hidePopupsee()">X</button>
                            </div>

                            <script>
                            function showPopupsee() {
                                var popup = document.getElementById("popupsee");
                                popup.style.display = "block";
                            }
                            function hidePopupsee() {
                                var popup = document.getElementById("popupsee");
                                popup.style.display = "none";
                            }
                            </script>
                            <a href="#" onclick="showPopup()" class="btn btn-primary">inscription</a>
                            <a href="#" onclick="showPopupDesinscription()" class="btn btn-primary">se desinscrire</a>
                            <a href="#" onclick="showPopupupdate()" class="btn btn-primary">mettre a jour des informations</a>
<div id="popup" style="display: none;">
    <h2>Formulaire</h2>
    <button class="close-button" onclick="closePopup()">X</button>
    <form method="post" action="save_data">
        <label for="input1">Nom :</label>
        <input type="text" name="nom" id="input1"><br><br>

        <label for="input2">Prénom :</label>
        <input type="text" name="prenom" id="input2"><br><br>

        <label for="input3">Date de naissance (format yyyy-mm-dd):</label>
        <input type="text" name="dnaiss" id="input3"><br><br>

        <label for="input4">nFFT :</label>
        <input type="text" name="nFFT" id="input4"><br><br>

        <label for="input5">Catégorie (adulte/enfant):</label>
        <input type="text" name="categorie" id="input5"><br><br>

        <label for="input6">Possesseur d'arme ? (0/1) :</label>
        <input type="text" name="possesseurarme" id="input6"><br><br>

        <label for="input7">nclub :</label>
        <input type="text" name="nclub" id="input7"><br><br>

        <label for="input8">Adresse :</label>
        <input type="text" name="adresse" id="input8"><br><br>

        <input type="submit" value="Envoyer">
    </form>
</div>

<div id="popupdelete" style="display: none;">
    <h2>Formulaire</h2>
    <button class="close-button" onclick="closePopupDelete()">X</button>
    <form method="post" action="desinscription_competiteur">
        <label for="input1">numéro FFT :</label>
        <input type="text" name="nFFT" id="input1"><br><br>
        <label for="input2">nom :</label>
        <input type="text" name="nom" id="input1"><br><br>
        <input type="submit" value="supprimer">
    </form>
</div>

<div id="popupupdate" style="display: none;">  <!--mise a jour competiteur-->
    <h2>mise a jour de données relatives a un competiteur</h2>
    <button class="close-button" onclick="closePopupupdate()">X</button>
    <form method="post" action="update_competiteur">
        <p style="color:red">Pour des raison de securité , il est impossible de modifier le numéro FFT d'un competiteur, pour cela il faut le supprimer et le recréer</p>

        <label for="input1">nFFT du competiteur a modifier :</label>
        <input type="text" name="nFFT" id="input1"><br><br>

        <p style="color:red">il est nécessaire de réinscrire les données,ne laissez aucun champ vide</p>
     
        <label for="input0">nom :</label>
        <input type="text" name="nom" id="input1"><br><br>


        <label for="input2">Prénom :</label>
        <input type="text" name="prenom" id="input2"><br><br>

        <label for="input3">Date de naissance (format yyyy-mm-dd):</label>
        <input type="text" name="dnaiss" id="input3"><br><br>

        <label for="input5">Catégorie (adulte/enfant):</label>
        <input type="text" name="categorie" id="input5"><br><br>

        <label for="input6">Possesseur d'arme ? (0/1) :</label>
        <input type="text" name="possesseurarme" id="input6"><br><br>

        <label for="input7">nclub :</label>
        <input type="text" name="nclub" id="input7"><br><br>

        <label for="input8">Adresse :</label>
        <input type="text" name="adresse" id="input8"><br><br>

        <input type="submit" value="mettre a jour">
    </form>
</div>



<script>
function showPopup() {
    var popup = document.getElementById("popup");
    popup.style.display = "block";
}

function closePopup() {
    var popup = document.getElementById("popup");
    popup.style.display = "none";
}


function showPopupDesinscription() {
    var popup = document.getElementById("popupdelete");
    popup.style.display = "block";
}

function closePopupDelete() {
    var popup = document.getElementById("popupdelete");
    popup.style.display = "none";
}

function showPopupupdate() {
    var popup = document.getElementById("popupupdate");
    popup.style.display = "block";
}

function closePopupupdate() {
    var popup = document.getElementById("popupupdate");
    popup.style.display = "none";
}
</script>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
