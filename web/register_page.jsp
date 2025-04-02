

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

                clip-path: polygon(50% 0%, 58% 0, 100% 0, 100% 100%, 70% 85%, 49% 95%, 15% 86%, 0 100%, 0 0, 36% 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
       
        <main class="primary-background p-5 banner-background">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h5>register here</h5>
                            </div>


                        <div class="card-body primary-background">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">user name</label>
                                    <input name="user_name" type="text" class="form-control" id="username" aria-describedby="emailHelp">
                                  </div>
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="form-group ">
                                    <div><label for="gender" class="form-check-label">gender</label>&nbsp;&nbsp;</div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="gender" id="gender_male" value="male" checked>male &nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="gender" id="gender_female" value="female" checked>female
                                </div>
                                <div class="form-group">
                                  <label for="about">about</label>
                                  <textarea name="about" class="form-control" name="about" id="about" rows="3"></textarea>
                                </div>
                                <div class="form-group form-check">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-4x "></span><<h4>please wait</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>

<!--                        <div class="card-footer">


                        </div>-->


                    </div>

                </div>
            </div>
        </main>









        
        <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>
    $(document).ready(function(){
        console.log("loaded...");
        
    $('#reg-form').on('submit',function(event){
       event.preventDefault();
       
       let form= new FormData(this);
       
       $("#submit-btn").hide();
       $("#loader").show();
       
       
       
//       send register servlet

        $.ajax({
            url:"RegisterServlet",
            type:'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    
                        $("#submit-btn").show();
                        $("#loader").hide();
                        
                        if(data.trim() === 'done')
                        {
                        swal("Register Successfully", "Thank youu..!", "now we sending you to login page.")
                                .then((value) => {
                                    window.location = "login_page.jsp"
                                });
                            }else{
                                swal(data);
                            }
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        
            swal("ERROR", "Something went wrong", "try again ");
                        
    },
            processData: false,
            contentType: false
                
        })
    });
        
    });
    
</script>

    </body>
    
    
    
</html>
