

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%--<%@page import="com.sun.jdi.connect.spi.Connection"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 58% 0, 100% 0, 100% 100%, 70% 85%, 49% 95%, 15% 86%, 0 100%, 0 0, 36% 0);
            }
        </style>
    </head>
    <body >
        <%@include file="normal_navbar.jsp" %>
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron banner-background">
                <div class="container">
                    
                <h3 class="display-3">Welcome,Friends</h3>
                <h3>Tech blog</h3>
                <p>Welcome to technical blog , aao betho hamari chati pe Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur numquam quod, similique illo doloribus nam fugit corporis dignissimos voluptates cumque molestiae possimus culpa ut atque, itaque voluptas at, hic earum!</p>
                    
                <button class="btn-outline-primary btn-lg">start its free</button>
                <button class="btn-outline-primary btn-lg"><a href="login_page.jsp">Log in</a></button>
            </div>
           
            </div>
        </div>
        <br>

        <!-- cards -->

        <div  class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style=" border-color:darkblue;">
                        <div class="card-body">
                            <h4 class="card-title">java programing language</h4>
                            <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Unde vitae aut quia repellendus .</p>
                            <a href="#" class="btn btn-primary">go for it</a> 
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="card" style=" border-color:darkblue;">
                        <div class="card-body">
                            <h4 class="card-title">java programing language</h4>
                            <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Unde vitae aut quia repellendus .</p>
                            <a href="#" class="btn btn-primary">go for it</a> 
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style=" border-color:darkblue;">
                        <div class="card-body">
                            <h4 class="card-title">java programing language</h4>
                            <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Unde vitae aut quia repellendus .</p>
                            <a href="#" class="btn btn-primary">go for it</a> 
                        </div>
                    </div>
                </div>
            </div>


            <br><br>

            <div class="row">
                <div class="col-md-4">
                    <div class="card" style=" border-color:darkblue;">
                        <div class="card-body">
                            <h4 class="card-title">java programing language</h4>
                            <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Unde vitae aut quia repellendus .</p>
                            <a href="#" class="btn btn-primary">go for it</a> 
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="card" style=" border-color:darkblue;">
                        <div class="card-body">
                            <h4 class="card-title">java programing language</h4>
                            <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Unde vitae aut quia repellendus .</p>
                            <a href="#" class="btn btn-primary">go for it</a> 
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style=" border-color:darkblue;">
                        <div class="card-body">
                            <h4 class="card-title">java programing language</h4>
                            <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Unde vitae aut quia repellendus .</p>
                            <a href="#" class="btn btn-primary">go for it</a> 
                        </div>
                    </div>
                </div>
            </div>

        </div>











        
        <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

<script>
        
        </script> 
    </body>
    
    
    
</html>
