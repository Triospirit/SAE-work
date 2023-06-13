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
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="http://localhost:8080/store/static/css/styles.css" rel="stylesheet" />

    <style>
        /* Styles pour les cases */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            grid-gap: 10px;
        }

        .case {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        /* Styles pour les images */
        .image img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }

        /* Styles pour les descriptions */
        .description {
            text-align: center;
            margin-top: 10px;
        }

        .description h3 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .description p {
            font-size: 14px;
            color: #888;
        }

        /* Styles pour les prix */
        .prix {
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
            color: #c00;
        }
    </style>
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
                    <a class="btn btn-primary" href="#store-start">visiter le magasin</a>
                </div>
            </div>
        </div>
    </header>
    <section class="grid-container">
        % for info in informations:
            <div class="case">
                <div class="image">
                    <!--non implementé-->
                </div>
                <div class="description">
                    <h3>${info['nom_arme']}</h3>
                    <p>calibre : ${info['calibre']}</p>
                    <p>marque : ${info['marque']}</p>
                    <p>etat : ${info['etat']}</p>
                    <p>classe : ${info['classe']}</p>
                </div>
                <div class="prix">
                    <p>${info['prix']} €</p>
                </div>
            </div>
        % endfor
    </section>
</body>
</html>
