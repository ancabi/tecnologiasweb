/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.ejb;

import app.entity.Grupo;
import app.entity.Post;
import app.entity.Usuario;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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
    
    public Grupo findGroup (String nombre) {
        Grupo gr = null;
        Query q = em.createNamedQuery("Grupo.findByNombre");
        q.setParameter("nombre", nombre.toUpperCase());
        List list = q.getResultList();
        if (!list.isEmpty()) { 
            gr = (Grupo) list.get(0);
        }
        return gr;
    }
    
    public BigDecimal findIdLastPost() {
        BigDecimal id = BigDecimal.ZERO;
        Query q = em.createNamedQuery("Post.findAll");
        List list = q.getResultList();
        if (!list.isEmpty()) {
            Post ps = (Post) list.get(list.size()-1);
            id = ps.getId();
        }
        return id;
    }
}
