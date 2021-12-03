package com.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;

import com.hibernate.bean.Content;
import com.hibernate.utils.HibernateUtil;
public class ContentDao  {
	public ArrayList<Content> getAll(){
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            // get an user object
		 ArrayList<Content>  listUser = (ArrayList<Content>)  session.createQuery("from Content", Content.class).getResultList();
		 return listUser;
        } catch (Exception e) {	          
            e.printStackTrace();
        }
	 return null;
	}
	
	public void saveContent(Content content) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			
			transaction = session.beginTransaction();
			session.save(content);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public boolean updateContent(Content content) {
		boolean result = false;
		Transaction transaction = null;
		 try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(content);
			transaction.commit();
			result = true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		}
		return result;
	}
	
	public boolean delete(int id){
		Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Content user = session.get(Content.class, id);
            if (user != null) {
                session.delete(user);
                System.out.println("user is deleted");
            }

            // commit transaction
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                return false;
            }
            e.printStackTrace();
            return false;
        }
    }
	public List<Content> search(String str){
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			NativeQuery query = session.createNativeQuery("SELECT * FROM content WHERE title LIKE '%"+ str+"%'" );
			List<Content> content = query.addEntity(Content.class).list();
			return content;
		} catch (Exception e) {	          
			e.printStackTrace();
			return null;
		}
	}
}
