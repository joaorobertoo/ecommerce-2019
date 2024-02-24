package DAO;

import Mapeamentos.Usuario;
import java.math.BigDecimal;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class DAOUsuario extends DAOGenerico<Usuario, BigDecimal> {

    public Usuario buscarLogin(Usuario usuario) {
        Session s = this.getSession();
        Usuario user = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery("from Usuario where email=:email and senha=:senha");
            q.setString("email", usuario.getEmail());
            q.setString("senha", usuario.getSenha());
            user = findOne(q);
            s.close();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.close();
        }
        return user;
    }

    public boolean salvarUsuario(Usuario usuario) {
        Session s = this.getSession();
        try {
            s.beginTransaction();           
            this.save(usuario);
            s.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
            return false;
        }
    }

    public Usuario verificaCpf(Usuario usuario) {
        Session s = this.getSession();
        Usuario user = null;
        try {
            s.beginTransaction();
            Query q = s.createQuery("from Usuario where cpf=:cpf");
            q.setString("cpf", usuario.getCpf());
            user = findOne(q);
            s.close();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.close();
        }
        return user;
    }

    public Usuario verificaEmail(Usuario usuario) {
        Session s = this.getSession();
        Usuario user1 = null;
        try {
            s.beginTransaction();
            Query q = s.createQuery("from Usuario where email=:email");
            q.setString("email", usuario.getEmail());
            user1 = findOne(q);
            s.close();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.close();
        }
        return user1;
    }

    public Usuario buscarPeloCpf(String cpf) {
        Session s = this.getSession();
        Usuario user = null;

        try {
            s.beginTransaction();
            Query q = s.createQuery("from Usuario where cpf=:cpf");
            q.setString("cpf", cpf);
            user = findOne(q);
            s.close();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.close();
        }
        return user;
    }
}
