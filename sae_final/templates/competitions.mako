<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>snipers's den</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
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
                        <h1 class="mx-auto my-0 text-uppercase">Snipers's den</h1>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5">Bienvenue sur mon appli web consacrée au tir de competition</h2>
                        <a class="btn btn-primary" href="#inscription">enregistrer une competition</a>
                        <a class="btn btn-primary" href="#scores">consulter un scoreboard</a>
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
                            <h4>enregistrer une competition</h4>
                            <a class="btn btn-primary" href="#non implementé" onclick="showPopup()">clickez ici!</a>
                        </div>
                        <div class="featured-text text-center text-lg-left">
                            <h4>supprimer une competition</h4>
                            <a class="btn btn-primary" href="#non implementé" onclick="showPopupdelete()">clickez ici!</a>
                        </div>
                        <div class="featured-text text-center text-lg-left">
                            <h4>mettre a jour les informations d'une competition</h4>
                            <a class="btn btn-primary" href="#non implementé" onclick="showPopupupdate()">clickez ici!</a>
                        </div>
                    </div>
                </div>
                <!-- Project One Row-->
                <div class="row gx-0 mb-5 mb-lg-0 justify-content-center" id="scores">
                    <div class="col-lg-6"><img class="img-fluid" src="assets/img/demo-image-01.jpg" alt="..." /></div>
                    <div class="col-lg-6">
                        <div class="bg-black text-center h-100 project">
                            <div class="d-flex h-100">
                                <div class="project-text w-100 my-auto text-center text-lg-left">
                                    <h4 class="text-white">consulter un score</h4>
                                    <a class="btn btn-primary" onclick="showPopupscore">clickez ici!</a> <!--score button-->
                                    <div id="popup">
                                        <h2>ajouter une competition</h2> <!--ajout de competitions-->
                                        <button class="close-button" onclick="closePopup()">X</button>
                                        <form method="post" action="inscr_comp">
                                            <label for="input1">nom de la competition :</label>
                                            <input type="text" name="nomcompet" id="input1"><br><br>
                                           
                                            <label for="input2">lieu de la competition :</label>
                                            <input type="text" name="lieu" id="input2"><br><br>

                                            <label for="input3">Date de la competition (sous forme YYYY-MM-DD) :</label>
                                            <input type="text" name="datecomp" id="input3"><br><br>

                                            <label for="input4">categorie (arme longues/arme courtes):</label>
                                            <input type="text" name="categorie" id="input4"><br><br>                                            

                                            <label for="input5">epreuve (precision/rapidite) :</label>
                                            <input type="text" name="epreuve" id="input5"><br><br>                                            

                                            <label for="input6">prix d'inscription :</label>
                                            <input type="text" name="prix_inscription" id="input6"><br><br>                                            

                                            <label for="input7">descriptif :</label>
                                            <input type="text" name="descriptif" id="input7"><br><br>                                            
                                            
                                            <label for="input8">premier prix :</label>
                                            <input type="text" name="unprix" id="input8"><br><br>

                                            <input type="submit" value="enregistrer">
                                        </form>
                                    </div>
                                    <!--suppression de competitions-->
                                    <div id="popupdelete">
                                        <h2>suppression d'une competition</h2>
                                        <button class="close-button" onclick="closePopupdelete()">X</button>
                                        <form method="post" action="suppr_comp">
                                            <label for="input1">nom de la competition :</label>
                                            <input type="text" name="nomcompet" id="input1"><br><br>

                                            <label for="input3">Date de la competition (sous forme YYYY-MM-DD) :</label>
                                            <input type="text" name="datecomp" id="input3"><br><br>

                                            <input type="submit" value="Envoyer">
                                        </form>
                                    </div>

                                    <div id="popupupdate">
                                        <h2>mise a jour d'une competitons</h2>
                                        <button class="close-button" onclick="closePopupupdate()">X</button>
                                        <form method="post" action="update_competition">
                                            <p style="color:red">vous ne pouvez pas modifier les nom et la date de la competition</p>
                                            <label for="input1">nom de la competition a modifier:</label>
                                            <input type="text" name="nom" id="input1"><br><br>

                                            <label for="input3">Date de la competition a modifier (sous forme YYYY-MM-DD) :</label>
                                            <input type="text" name="date" id="input3"><br><br>


                                            <label for="input2">lieu de la competition :</label>
                                            <input type="text" name="lieu" id="input2"><br><br>

                                            <label for="input4">categorie (arme longues/arme courtes):</label>
                                            <input type="text" name="categorie" id="input4"><br><br>                                            

                                            <label for="input5">epreuve (precision/rapidite) :</label>
                                            <input type="text" name="epreuve" id="input5"><br><br>                                            

                                            <label for="input6">prix d'inscription :</label>
                                            <input type="text" name="prix_inscription" id="input6"><br><br>                                            

                                            <label for="input7">descriptif :</label>
                                            <input type="text" name="descriptif" id="input7"><br><br>                                            
                                            
                                            <label for="input8">premier prix :</label>
                                            <input type="text" name="unprix" id="input8"><br><br>

                                            <input type="submit" value="mettre a jour">
                                        </form>
                                    </div>
                                        <div id="popupscore" class="score-row">
                                            <h2>scores:</h2>
                                            % for score in scores: 
                                                <p>nFFT competiteur: ${score['competiteur_num']}</p>
                                                <p>nom de la competition: ${score['competition_nom']}</p>
                                                <p>score: ${score['score']}</p>
                                            % endfor
                                        </div>

                                    <script>
                                        function showPopupdelete() {
                                            var popupdelete = document.getElementById("popupdelete");
                                            popupdelete.style.display = "block";
                                        }
                                        function closePopupdelete() {
                                            var popupdelete = document.getElementById("popupdelete");
                                            popupdelete.style.display = "none";
                                        }
                                        function showPopupupdate() {
                                            var popupupdate = document.getElementById("popupupdate");
                                            popupupdate.style.display = "block";
                                        }
                                        function closePopupupdate() {
                                            var popupupdate = document.getElementById("popupupdate");
                                            popupupdate.style.display = "none";
                                        }
                                        function showPopupscore() {
                                            var popupupdate = document.getElementById("popupscore");
                                            popupupdate.style.display = "block";
                                        }
                                        function closePopupscore() {
                                            var popupupdate = document.getElementById("popupscore");
                                            popupupdate.style.display = "none";
                                        }
                                </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<style>
    .popup {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }
</style>


        </section>
        <script>
            function showPopup() {
                var popup = document.getElementById("popup");
                popup.style.display = "block";
            }
            function closePopup() {
                var popup = document.getElementById("popup");
                popup.style.display = "none";
            }
        </script>
    </body>
</html>