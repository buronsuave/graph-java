<%-- 
    Document   : routes
    Created on : 17/06/2021, 05:12:36 AM
    Author     : David
--%>

<%@page import="models.Route"%>
<%@page import="data.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Graph | Nodes</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://bootswatch.com//5/darkly/bootstrap.css">
    <link rel="stylesheet" href="https://bootswatch.com//_vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://bootswatch.com//_vendor/prismjs/themes/prism-okaidia.css">
    <link rel="stylesheet" href="https://bootswatch.com//_assets/css/custom.min.css">

</head>
<body>



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
            <div class="card-header">Results</div>
            <div class="card-body">
                <h4 class="card-title">Possible Routes</h4>
                <br>
                <ul class="list-group">
                    <% for(int i = 0; i < Routes.get().getRoutes().size(); i++) { 
                        Route route = Routes.get().getRoutes().get(i);
                        String routePath = "";
                        for (int j = route.getNodes().size()-1; j >= 0; j--) {
                            routePath += route.getNodes().get(j).getName();
                            if (j > 0) {
                                routePath += ", ";
                            }
                        }
                    %>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <%= routePath %>
                        <span class="badge bg-primary rounded-pill">
                            <%= route.getNodes().size() %>
                        </span>
                    </li>
                    <% } %>
                </ul>
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
