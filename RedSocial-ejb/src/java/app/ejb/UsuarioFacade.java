/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.ejb;

import app.entity.Usuario;
import java.math.BigDecimal;
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
public class UsuarioFacade extends AbstractFacade<Usuario> {
    @PersistenceContext(unitName = "RedSocial-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public void borrarInvitacion (Usuario u, Usuario u2) {
        
        List<Usuario> invitaciones=u.getUsuarioList2();
        invitaciones.remove(u2);
        u.setUsuarioList2(invitaciones);
        
          
        List<Usuario> invitaciones2=u2.getUsuarioList3();
        invitaciones2.remove(u);
        u.setUsuarioList3(invitaciones2);
        
        em.merge(u);
        em.merge(u2);
        
    }

    public void aceptarInvitacion(Usuario u, Usuario u2) {
        
        List<Usuario> amigos=u.getUsuarioList();
        amigos.add(u2);
        u.setUsuarioList(amigos);
        
        List<Usuario> amigos1=u.getUsuarioList1();
        amigos1.add(u);
        u.setUsuarioList1(amigos1);
        
        List<Usuario> amigos2=u2.getUsuarioList();
        amigos2.add(u);
        u2.setUsuarioList(amigos2);
        
        List<Usuario> amigos21=u2.getUsuarioList1();
        amigos21.add(u2);
        u2.setUsuarioList1(amigos21);
        
        em.merge(u);
        em.merge(u2);
        
        borrarInvitacion(u, u2);
        
    }

    public List<Usuario> buscarUsuario(String buscar) {
        Query q;
        List<Usuario> usuarios;        
        buscar=buscar.toUpperCase();
        //q = em.createQuery("SELECT u FROM Usuario u WHERE UPPER(u.nombre) LIKE '%A%' OR UPPER(u.apellidos) LIKE '%A%' AND u.id <> 2 AND u.id NOT IN (SELECT u.usuarioList.IDUSUARIO2 FROM Usuario u WHERE u.usuarioList.IDUSUARIO1=2)");
        //q.setParameter(1, buscar);
        //q.setParameter(2, buscar);
        q = em.createQuery("SELECT u FROM Usuario u WHERE UPPER(u.nombre) LIKE ?1 OR UPPER(u.apellidos) LIKE ?2");
        q.setParameter(1, buscar);
        q.setParameter(2, buscar);
        usuarios = q.getResultList();
        
        return usuarios;
    }
        
}
