
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="error_page.jsp" %>
<script src="js/myjs.js"></script>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<% 
    int postId=Integer.parseInt(request.getParameter("post_id"));

    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    Post p = d.getPostByPostId(postId);
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || techBLOG</title>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    </head>
    <body>
        
         <!--NAVBAR-->
        <nav class="navbar navbar-expand-sm navbar-dark text-white" style="background-color: #000000; ">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
                    aria-expanded="false" aria-label="Toggle navigation"></button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <span><i class="fa fa-bell-o"></i></span>
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">programing language</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Project implimentaiton</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Data structure</a>
                    </li>
                    <li>
                        <a class="nav-link" href="login_page.jsp">Log in</a>
                    </li>
                    <li>
                        <a class="nav-link" href="register_page.jsp">Registration Page</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" href=" #" data-bs-toggle="modal" data-bs-target="#add-post-modal">Do post</a>
                    </li>
                    
                    

                </ul>

                <ul class="navbar-nav ml-auto ">
                    <li class="nav-item">
                        <div class="text-white mr-auto mt-2 blockquote " data-bs-toggle="modal" data-bs-target="#profileModal" ><span class="fa fa-user-circle"></span><%= user.getName()%></div>
                    </li>

                    <li class="nav-item">
                        <button class="btn btn-outline-primary btn-sm"><a class="nav-link" href="LogOutServlet">Logout</a></button>
                    </li>
                </ul>

            </div>
        </nav>
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
        
        <!--main content of body-->
        
        <div class="container">
            <div class="row my-4">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="text-center"><%= p.getpTitle() %></h4>
                    </div>
                    <div class="card-body">
                        <p><%= p.getpContent() %></p>
                        <br><!-- comment -->
                         <img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="...">
                         <br><!-- comment -->
                         
                         <div class="row my-2" style="border: 1px solid #000000;padding-top: 15px">
                             <div class="col-md-8">
                                 <% UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                    
                                 %> 
                                 
                                 
                                 <p><%= ud.getUserByUserId(p.getUserId()).getName() %> has posted here :-</p>
                             </div>
                             <div class="col-md-4">
                                 <p><%=p.getpDate().toString() %></p>
                             </div>
                         </div>
                         
                         
                        <br>
                        <p><%= p.getpCode() %></p>
                    </div>
                    <div class="card-footer text-center">
                        
                        <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            
                            %>
                        
                            <a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-sm btn-outline-primary"><i class="fa fa-heart-o"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>
                            <!--<a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-sm btn-outline-primary">read more..</a>-->
                            <a href="#!" class="btn btn-sm btn-outline-primary"><i class="fa fa-commenting-o"></i><span>5</span></a>
                        
                    </div>
                </div>
            </div>
        </div>
        
        
        <!--main content of body end-->
                        
                        
                        
                        
                        
                        
     <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h4 class="modal-title" id="exampleModalLabel">TechBlog</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body ">
                        <img src="pics/<%= user.getProfile()%>" class="img-fluid rounded-circle mx-auto d-block" style="width: 150px; height: 150px;"/>
                        <h5 class="modal-title text-center" id="exampleModalLabel"><%= user.getName()%></h5>
                    </div>

                    <!--details-->
                    <div id="profile-details">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>ID</td>
                                <td><%= user.getId()%></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Email</td>
                                <td><%= user.getEmail()%></td>

                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Gender</td>
                                <td><%= user.getGender()%></td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>About</td>
                                <td><%= user.getAbout()%></td>
                            </tr>                
                        </tbody>
                    </table>
                    </div>
                            
                            
                            
                    <!--profile edit-->        
                    <div id="profile-edit" style="display: none">
                        <h2 class="mt-2 text-center">Please , Edit Carefully...</h2>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" name="user_email" value="<%= user.getEmail()%>" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" name="user_name" value="<%= user.getName()%>" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" name="user_password" value="<%= user.getPassword()%>" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%= user.getGender().toUpperCase() %></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td>
                                        <textarea rows="3" name="user_about" class="form-control"><%= user.getAbout() %> </textarea></td>
                                </tr>
                                <tr>
                                    <td>Select New Profile Pic :</td>
                                    <td>
                                        <input type="file" name="image" class="form-control">
                                    </td>
                                </tr>
                            </table>
                                
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                        </form>    
                        
                    </div>
                    
                    
                    

                    <div class="modal-footer">
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

<!--===============================================================-->

       <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        

<!--        <script>
            $(document).ready(function(){
                let editStatus=false;  
                
                $('#edit-profile-button').click(function(){
                    if(editStatus == false){
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus=true;
                        
                        $(this).text("Back");
                    }else{
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus=false;
                        
                        $(this).text("Edit");
        }           
                })
            });
            
            
        </script>-->
        
        
        <!--now add post js-->
        
<!--        <script>
            $(document).ready(function(e){
                    
                    $("#add-post-form").on("submit",function(event){
                       //this code get called when form is submited...
                       
                       event.preventDefault();     //form automaticaly submit nahi thase rokai jase
                       console.log("you have click on submit...");
                       let form = new FormData(this);      //form no data badho form variable ma chalyo jase
                       
                       //now requesting to server
                       
                       $.ajax({
                           url: "AddPostServlet",
                           type: 'POST',
                           data: form,
                           success: function (data, textStatus, jqXHR) {
                                ///success...
                                console.log(data);
                                if(data.trim() === 'done'){
                                    swal("good job","saved successfully","success");
                                }else{
                                    swal("error...","something went wrong","error");
                                }
                            },
                           error: function (jqXHR, textStatus, errorThrown) {
                                ///error...
                                    swal("error...","something went wrong 2","error");
                            },
                            processData: false,
                            contentType: false
                       });
                       
                       
                       
                    });
            });
        </script>-->
        
        
        <!--loading post using ajax-->
<!--        <script>
            
            function getPosts(catId,temp){
                
                $(".c-link").removeClass('active');
                
                 $.ajax({
                    url: "load_posts.jsp",
                    data : {cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        
                        $("#post-container").html(data);
                        
                        $(temp).addClass('active');
                    }
                })
                
            }
            
            $(document).ready(function(e){
                let allPostRef=$('.c-link')[0]
                getPosts(0,allPostRef);
            })
        </script>-->

    </body>
</html>
