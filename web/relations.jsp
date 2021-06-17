<%-- 
    Document   : relations
    Created on : 16/06/2021, 08:22:05 PM
    Author     : David
--%>

<%@page import="data.Nodes, models.Node" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Graph | Relations</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://bootswatch.com//5/darkly/bootstrap.css">
    <link rel="stylesheet" href="https://bootswatch.com//_vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://bootswatch.com//_vendor/prismjs/themes/prism-okaidia.css">
    <link rel="stylesheet" href="https://bootswatch.com//_assets/css/custom.min.css">

</head>
<body onload='onLoadListener();'>
    <script>
        const relations = [];
        var nodes = [];
        var node;
        var relation;
        var relationListElement;
        var relationOriginElement;
        var relationDestinyElement;
        var optionOriginElement;
        var optionDestinyElement;
        var i, j;
        var rowContainer, colContainer;

        const onLoadListener = () => {
            relation = {originId: 0, destinyId: 1, idO: 'o' + 0, idD: 'd' + 0};
            relations.push(relation);
            nodes = JSON.parse('<%= Nodes.get().getJSON()%>');
            paintRelations();
        };

        const paintRelations = () => {
            routeListElement = document.getElementById('relationlist');
            routeListElement.innerHTML = '';
            for (i = 0; i < relations.length; i++) {
                relationOriginElement = document.createElement('select');
                relationOriginElement.id = relations[i].idO;
                relationOriginElement.name = '' + relations[i].idO;
                relationOriginElement.classList.add('form-select');

                relationOriginElement.addEventListener("change", () => {
                    updateRelations();
                    paintRelations();
                });

                for (j = 0; j < nodes.length; j++) {
                    optionOriginElement = document.createElement('option');
                    optionOriginElement.value = nodes[j].id;
                    optionOriginElement.innerHTML = nodes[j].name;
                    relationOriginElement.appendChild(optionOriginElement);
                }

                relationOriginElement.value = relations[i].originId;

                relationDestinyElement = document.createElement('select');
                relationDestinyElement.id = relations[i].idD;
                relationDestinyElement.name = '' + relations[i].idD;
                relationDestinyElement.classList.add('form-select');

                for (j = 0; j < nodes.length; j++) {
                    if (j === relations[i].originId) {
                        continue;
                    }

                    optionDestinyElement = document.createElement('option');
                    optionDestinyElement.value = nodes[j].id;
                    optionDestinyElement.innerHTML = nodes[j].name;
                    relationDestinyElement.appendChild(optionDestinyElement);
                }
                
                relationDestinyElement.value = relations[i].destinyId;

                rowContainer = document.createElement('div');
                rowContainer.classList.add('row');

                colContainer = document.createElement('div');
                colContainer.classList.add('col');
                colContainer.appendChild(relationOriginElement);

                rowContainer.appendChild(colContainer);

                colContainer = document.createElement('div');
                colContainer.classList.add('col');
                colContainer.appendChild(relationDestinyElement);

                rowContainer.appendChild(colContainer);
                routeListElement.appendChild(rowContainer);
            }
        };

        const updateRelations = () => {
            for (i = 0; i < relations.length; i++) {
                relationOriginElement = document.getElementById(relations[i].idO);
                relationDestinyElement = document.getElementById(relations[i].idD);
                relations[i].originId = parseInt(relationOriginElement.value);
                if (relationOriginElement.value !== relationDestinyElement.value) {
                    relations[i].destinyId = parseInt(relationDestinyElement.value);
                } else {
                    relations[i].destinyId = (parseInt(relationDestinyElement.value)+1)%(nodes.length);
                }
            }
        };

        const addRelation = () => {
            updateRelations();
            relation = {originId: 0, destinyId: 1, idO: 'o' + relations.length, idD: 'd' + relations.length};
            relations.push(relation);
            paintRelations();
        };

        const removeRelation = () => {
            if (relations.length > 1) {
                updateRelations();
                relations.pop();
                paintRelations();
            }
        };
    </script>

    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
        <div class="container">
            <a href="./" class="navbar-brand">Java Graph Routes</a>
        </div>
    </div>

    <div class="container">
        <div class="page-header" id="banner">
            <div class="row">
                <div class="col-lg-8 col-md-7 col-sm-6">
                    <h1>Java Routes Project</h1>
                    <p class="lead">Lets find the way!</p>
                </div>
            </div>
        </div>

        <div class="card border-secondary mb-5" style="max-width: 100rem;">
            <div class="card-header">Step 2</div>
            <div class="card-body">
                <h4 class="card-title">Capture Relations</h4>
                <br>
                <form action="RelationRecorder" method="post">
                    <fieldset>
                        <div class="container">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col"><h4>Origin</h4></div>
                                    <div class="col"><h4>Destiny</h4></div>
                                </div>
                                <div id="relationlist"></div> 
                            </div>
                            <br>
                            <button type="button" class="btn btn-success" onclick='addRelation();'>
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btn btn-danger" onclick='removeRelation();'>
                                <i class="fa fa-trash" aria-hidden="true"></i>
                            </button>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </fieldset>
                </form>
            </div>
        </div>

        <footer id="footer">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-unstyled">
                        <li><a href="https://buronsuave.blogspot.com/">Blog</a></li>
                        <li><a href="https://twitter.com/buronsuave">Twitter</a></li>
                        <li><a href="https://github.com/buronsuave">GitHub</a></li>
                    </ul>
                    <p>Made by <a href="https://github.com/buronsuave">David Lopez</a>.</p>
                    <p>Based on <a href="https://getbootstrap.com/" rel="nofollow">Bootstrap</a>. Icons from <a href="https://fontawesome.com/" rel="nofollow">Font Awesome</a>. Web fonts from <a href="https://fonts.google.com/" rel="nofollow">Google</a>.</p>

                </div>
            </div>
        </footer>
    </div>

    <script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
    <script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://bootswatch.com/_vendor/prismjs/prism.js" data-manual=""></script>
    <script src="https://bootswatch.com/_assets/js/custom.js"></script>
</body>
</html>
