<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechSoft | <%= user.getName()%></title>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <!--NAVBAR-->
        <nav class="navbar navbar-expand-sm navbar-dark text-white" style="background-color: #000000; ">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
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

        <!--END OF NAVBAR-->
        
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
        
        <!--main body of page start-->
 
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
                              All Posts
                            </a>
                            <%
                                PostDao d=new PostDao(ConnectionProvider.getConnection());
                                
                                ArrayList<Category> list1 = d.getAllCategories();
                                
                                for(Category cc:list1){
                                    %>
                                    <a href="#" onclick="getPosts(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()  %></a>

                                    <%
                                }
                                
                                %>
                        </div>

                    </div>
                    <!--second col-->
                    <div class="col-md-8">
                        <!--post-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="text-center">loading...</h3>
                        </div>
                        
                        <div class="container-fluid text-center" id="post-container">
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
        
                        

        <!--main body of page end-->
                        
        <!--start of profile modal-->

        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h4 class="modal-title" id="exampleModalLabel">TechBlog</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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




        <!--end of profile modal-->
        
        
        <!--start of post modal-->
        

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Provide the Post Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                  <!--<option>---select category---</option>-->
                  <%
                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                    
                    ArrayList<Category> list = postd.getAllCategories();
                    
                    for(Category c:list)
                    {
                      %>
                      <option value="<%= c.getCid() %>"><%= c.getName()%></option>
                  <%
                      }  
                      %>
              </select>
              </div>
              
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter the title" class="form-control">
              </div>
              <div class="form-group">
                  <textarea name="pContent" placeholder="Enter your content here" class="form-control" style="height: 200px"></textarea>
              </div>
              <div class="form-group">
                  <textarea name="pCode" placeholder="Enter your Program (if any)" class="form-control" style="height: 200px"></textarea>
              </div>
              <div class="form-group">
                  <label>select your pic..</label><br>
                  <input type="file" name="pic">
              </div>
              
              <div class="container text-center">
                  <button type="submit" class="btn btn-outline-primary">POST</button>
              </div>

          </form>
          
      </div>
    </div>
  </div>
</div>
        
        
        <!--end of post modal-->



<!--
        <%= user.getName()%><br/>
        <%= user.getEmail()%><br/>
        <%= user.getAbout()%><br/>-->




        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        

        <script>
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
            
            
        </script>
        
        
        <!--now add post js-->
        
        <script>
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
        </script>
        
        
        <!--loading post using ajax-->
        <script>
            
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
        </script>
        
        
    </body>
</html>
