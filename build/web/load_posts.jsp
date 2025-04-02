
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<script src="js/myjs.js"></script>

<div class="row">

<%
    User uuu = (User)session.getAttribute("currentUser");
    
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null;
    if(cid==0){
        posts=d.getAllPosts();
    }else{
        posts = d.getAllPostByCatId(cid);
    }
    
    if(posts.size() == 0){
        out.println("<h4 class='text-center'>There is no posts currently availible in this category, try next time...</h4>");
        return;
    }
    
    for(Post p:posts){
    %>

    <div class="col-md-6">
        <div class="card">
            <img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="...">
            <div class="card-body">
                <b><%= p.getpTitle() %></b>
                <p><%= p.getpContent() %><p>
                <!--<pre><%= p.getpCode()%></pre>-->
            </div>
            <div class="card-footer">
                
                <%
                    LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
                    
                    %>
                
                    <a href="#!" onclick="doLike(<%=p.getPid() %>,<%=uuu.getId() %>)"  class="btn btn-sm btn-outline-primary"><i class="fa fa-heart-o"></i><span class="like-counter"><%=ldao.countLikeOnPost(p.getPid()) %></span></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-sm btn-outline-primary">read more..</a>
                <a href="#!" class="btn btn-sm btn-outline-primary"><i class="fa fa-commenting-o"></i><span>5</span></a>
                
            </div>
        </div>
        
    </div>
    
    
    <%
    }
%>



</div>