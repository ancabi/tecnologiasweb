/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.ejb;

import app.entity.Post;
import app.entity.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ancabi
 */
@Stateless
public class PostFacade extends AbstractFacade<Post> {
    @PersistenceContext(unitName = "RedSocial-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostFacade() {
        super(Post.class);
    }
    
    
    public List<Post> listaPostPersonal (Usuario u){
        List<Post> post = u.getPostList();
        return post;
    }
    
    public List<Post> listaPostMuro (Usuario u){
        List<Usuario> amigos = u.getUsuarioList();
        List<Post> post = new ArrayList<Post>();
        for(Usuario user: amigos){
            post.addAll(user.getPostList());
        }      
        return post;
    }
    
}
