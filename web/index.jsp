<%-- 
    Document   : index
    Created on : 16/06/2021, 06:03:19 PM
    Author     : David
--%>

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
<body onload='onLoadListener();'>

    <script>
        const nodes = [];
        var node;
        var nodeListElement;
        var nodeElement;
        var i;

        const onLoadListener = () => {
            node = {id: 0, name: ''};
            nodes.push(node);
            node = {id: 1, name: ''};
            nodes.push(node);
            paintNodes();
        };

        const paintNodes = () => {
            nodeListElement = document.getElementById('nodelist');
            nodeListElement.innerHTML = '';
            for (i = 0; i < nodes.length; i++) {
                nodeElement = document.createElement('input');
                nodeElement.type = 'text';
                nodeElement.id = '' + nodes[i].id;
                nodeElement.name = 'node' + nodes[i].id;
                nodeElement.placeholder = 'Node ' + (i + 1) + ' Name';
                nodeElement.classList.add('form-control');
                nodeElement.value = nodes[i].name;
                nodeElement.required = true;
                nodeListElement.appendChild(nodeElement);
            }
        };

        const updateNodes = () => {
            for (i = 0; i < nodes.length; i++) {
                nodeElement = document.getElementById(nodes[i].id);
                nodes[i].name = nodeElement.value;
            }
        };

        const addNode = () => {
            updateNodes();
            node = {id: nodes.length, name: ''};
            nodes.push(node);
            paintNodes();
        };

        const removeNode = () => {
            if (nodes.length > 2) {
                updateNodes();
                nodes.pop();
                paintNodes();
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
            <div class="card-header">Step 1</div>
            <div class="card-body">
                <h4 class="card-title">Capture Nodes</h4>
                <br>
                <form action="NodeRecorder" method="post">
                    <fieldset>
                        <div class="container">
                            <div class="form-group">
                                <div id="nodelist"></div>
                            </div>
                            <br>
                            <button type="button" class="btn btn-success" onclick='addNode();'>
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btn btn-danger" onclick='removeNode();'>
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
