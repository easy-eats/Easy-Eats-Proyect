/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import entidades.Ingreso;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author sergi
 */
@Stateless
public class IngresoFacade extends AbstractFacade<Ingreso> {

    @PersistenceContext(unitName = "Easy_Eats_ProyectoPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public IngresoFacade() {
        super(Ingreso.class);
    }
    
}
