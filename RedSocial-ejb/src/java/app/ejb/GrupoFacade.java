/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.ejb;

import app.entity.Grupo;
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
public class GrupoFacade extends AbstractFacade<Grupo> {
    @PersistenceContext(unitName = "RedSocial-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GrupoFacade() {
        super(Grupo.class);
    }
    
    public void insertGrupo(Grupo g){
        
        em.persist(g);
    }
      
       public Grupo seleccionarGrupo() {

        Query q;
        q = em.createNamedQuery("Grupo.findAll");
        List<Grupo> grupos = q.getResultList();
        Grupo grupo = grupos.get(grupos.size()-1);
        
        return grupo;

      
    }
    
    
}
