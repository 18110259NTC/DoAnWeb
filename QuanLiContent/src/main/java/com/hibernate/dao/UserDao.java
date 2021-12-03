package com.hibernate.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.bean.Member;
import com.hibernate.utils.HibernateUtil;
import com.hibernate.utils.MD5Util;



public class UserDao {

	public void saveUser(Member user) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	public Member validate(String email, String password) {
		MD5Util md = new MD5Util();
		
		String endCodePass = md.getMD5(password);
        Transaction transaction = null;
        Member user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (Member) session.createQuery("FROM Member U WHERE U.email = :email").setParameter("email", email)
                .uniqueResult();

            if (user != null && user.getPassword().equals(endCodePass)) {
                return user;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }
	public boolean checkEmailExist(String email){
		 try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            // start a transaction
	            // get an user object
			 Member  user =  (Member)session.createQuery("SELECT u FROM Member u WHERE email = :email ").setParameter("email", email).uniqueResult();
			 if (user != null) {
				 return true;
			 } else {
				 return false;
			 }
	        } catch (Exception e) {	          
	            e.printStackTrace();
	        }
		 return false;
	}
	public ArrayList<Member> getAll(){
		 try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            // start a transaction
	            // get an user object
			 ArrayList<Member>  listUser =  (ArrayList<Member>)session.createQuery("SELECT u FROM Member u", Member.class).getResultList();
			 return listUser;
	        } catch (Exception e) {	          
	            e.printStackTrace();
	        }
		 return null;
	}
	
	public boolean updateUser(Member member) {
		boolean result = false;
		Transaction transaction = null;
		 try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(member);
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

}