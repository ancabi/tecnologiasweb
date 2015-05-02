/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.ejb;

import app.entity.Usuario;
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

    public void borrarInvitacion(Usuario u, Usuario u2) {

        List<Usuario> invitaciones = u.getUsuarioList2();
        invitaciones.remove(u2);
        u.setUsuarioList2(invitaciones);

        List<Usuario> invitaciones2 = u2.getUsuarioList3();
        invitaciones2.remove(u);
        u.setUsuarioList3(invitaciones2);

        em.merge(u);
        em.merge(u2);

    }

    public void aceptarInvitacion(Usuario u, Usuario u2) {

        List<Usuario> amigos = u.getUsuarioList();
        amigos.add(u2);
        u.setUsuarioList(amigos);

        List<Usuario> amigos1 = u.getUsuarioList1();
        amigos1.add(u);
        u.setUsuarioList1(amigos1);

        List<Usuario> amigos2 = u2.getUsuarioList();
        amigos2.add(u);
        u2.setUsuarioList(amigos2);

        List<Usuario> amigos21 = u2.getUsuarioList1();
        amigos21.add(u2);
        u2.setUsuarioList1(amigos21);

        em.merge(u);
        em.merge(u2);

        borrarInvitacion(u, u2);

    }

    public List<Usuario> buscarUsuario(String buscar, int id) {
        Query q;
        List<Usuario> usuarios;
        buscar = buscar.toUpperCase();
        q = em.createQuery("SELECT u FROM Usuario u WHERE u.id != :idU AND (UPPER(u.nombre) LIKE :buscar1 OR UPPER(u.apellidos) LIKE :buscar2)");
        buscar = "%" + buscar + "%";
        q.setParameter("idU", id);
        q.setParameter("buscar1", buscar);
        q.setParameter("buscar2", buscar);
        usuarios = q.getResultList();

        return usuarios;
    }

    public Usuario buscarUltimoUsuario() {
        Usuario res = null;
        Query q;
        q = em.createNamedQuery("Usuario.findAll");
        List lista = q.getResultList();
        res = (Usuario) lista.get(lista.size() - 1);
        return res;
    }
    
    public Usuario usuarioRegistrado(String usuario, String pass) {
        Usuario res = null;
        Query q;
        q = em.createNamedQuery("Usuario.findByUsuario");
        q.setParameter("usuario", usuario);
        List lista = q.getResultList();
        if (!lista.isEmpty()) {
            Usuario u = (Usuario) lista.get(0);
            if (pass.equals(u.getPassword())) {
                res = u;
            }
        }
        return res;
    }

    public void agregarInvitacion(Usuario u2, Usuario u) {

        //Agrego la invitacion al usuario
        List<Usuario> invitaciones2 = u2.getUsuarioList2();
        invitaciones2.add(u);
        u.setUsuarioList2(invitaciones2);

        //Agrego al usuario como invitador
        List<Usuario> invitaciones = u.getUsuarioList3();
        invitaciones.add(u2);
        u.setUsuarioList3(invitaciones);

        //em.merge(u);
        em.merge(u2);

    }

}
