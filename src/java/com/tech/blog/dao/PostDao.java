package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;
import static java.lang.System.out;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list=new ArrayList<>();
        
        try {
            
            String q="select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description = set.getString("description");
                
                Category c=new Category(cid,name,description);
                list.add(c);
                
            }
            
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return list;
        
    }
    
    public boolean savePost(Post p) throws SQLException{
        boolean f = false;
        
              
        try {
            String q = "insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values (?,?,?,?,?,?)";
        
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();
            f=true;
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return f;
        
    }
    
    public List<Post> getAllPosts(){
        
        List<Post> list = new ArrayList<>();
//        fetch all the data
        try {
            
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate");
                String pdateStr = pdate.toString();
                int cId = set.getInt("catid");
                int pId = set.getInt("userid");
                
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, pdateStr, cId, pId);
                
                list.add(post);
                        
            }                        
        } catch (SQLException e) {
            System.out.println(e);
        }


        return list;
    }
    
    public List<Post> getAllPostByCatId(int catId){
        
        List<Post> list = new ArrayList<>();
//        fetch all the data by catId
        try {
            
            PreparedStatement p = con.prepareStatement("select * from posts where catid=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate");
                String pdateStr = pdate.toString();
                int pId = set.getInt("userid");
                
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, pdateStr, catId, pId);
                
                list.add(post);
                        
            }                        
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }    
    
    public Post getPostByPostId(int postId){
        Post post=null;
        String q = "Select * from posts where pid=?";
        
        try{
            PreparedStatement p = this.con.prepareStatement(q);
            
            p.setInt(1, postId);
            
            ResultSet set = p.executeQuery();
            
            if(set.next()){
                
                int pid = set.getInt("pid");
                int catId = set.getInt("catid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate");
                String pdateStr = pdate.toString();
                int userId = set.getInt("userid");
                
                post = new Post(pid, pTitle, pContent, pCode, pPic, pdateStr, catId, userId);
                
            }
            
        }catch(SQLException e){
            System.out.println(e);
        }
        return post;
    }
    
}
