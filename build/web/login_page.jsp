

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%--<%@page import="com.sun.jdi.connect.spi.Connection"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>log in page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 58% 0, 100% 0, 100% 100%, 70% 85%, 49% 95%, 15% 86%, 0 100%, 0 0, 36% 0);
            }
        </style>-->
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        
        <main class="d-flex align-item-center" style="height:70vh ">
        <div class="container ">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card ">
                        <div class="card-header">
                            <p>log in here</p>
                        </div>

                        <%
                            Message m= (Message)session.getAttribute("msg");
                            if(m!=null){
                                %>
                        <div class="alert <%= m.getcssClass()%>" role="alert">
                            <%= m.getContent()  %>
                        </div>                                
                                
                                <%
                                    session.removeAttribute("msg");
                                } 
                        %>

                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                </div>
<!--                                <div class="form-group form-check">
                                  <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                </div>-->
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>


                        </div>

                    </div>
                </div>
            </div>
        </div>
                        
                        
                        
                        
                        
                       
                        
                        
                        
                        
                        
      
                        
                        
                        
                        
                        
                        
                        
                        


    </main>
                         =======================================================================================

 <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
              <p class="text-white-50 mb-5">Please enter your login and password!</p>

              <div data-mdb-input-init class="form-outline form-white mb-4">
                <input type="email" id="typeEmailX" class="form-control form-control-lg" />
                <label class="form-label" for="typeEmailX">Email</label>
              </div>

              <div data-mdb-input-init class="form-outline form-white mb-4">
                <input type="password" id="typePasswordX" class="form-control form-control-lg" />
                <label class="form-label" for="typePasswordX">Password</label>
              </div>

              <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>

              <button data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>

              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

            <div>
              <p class="mb-0">Don't have an account? <a href="#!" class="text-white-50 fw-bold">Sign Up</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

        
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
