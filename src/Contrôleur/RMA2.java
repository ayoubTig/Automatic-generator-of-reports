package Contrôleur;

import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.Map;

//import javax.servlet.ServletContext;
import javax.servlet.ServletException;
//import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import pl.jsolve.templ4docx.variable.ImageType;
//import pl.jsolve.templ4docx.variable.ImageVariable;
//import com.aspose.words.Document;

//import com.aspose.words.ImportFormatMode;
//import com.aspose.words.SectionStart;
//import com.sun.scenario.effect.Merge;

import metier.*;
import DAO.*;

//import java.util.logging.Level;
//import java.util.logging.Logger;
//import pl.jsolve.templ4docx.core.Docx;
//import pl.jsolve.templ4docx.core.VariablePattern;
//import pl.jsolve.templ4docx.variable.ImageVariable;
//import pl.jsolve.templ4docx.variable.TextVariable;
//import pl.jsolve.templ4docx.variable.Variables;

/**
 * Servlet implementation class RMA
 */
@WebServlet("/RMA2")
public class RMA2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RMA2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 doPost(request,response);

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sission = request.getSession();

		if (((String) sission.getAttribute("page")).equals("inscrire"))
			if (request.getParameter("nom") == null || request.getParameter("email") == null
					|| request.getParameter("pass") == null || request.getParameter("Confpass") == null
					|| request.getParameter("nom") == "" || request.getParameter("email") == ""
					|| request.getParameter("pass") == "" || request.getParameter("Confpass") == ""
					|| request.getParameter("ad") == "") 
			{getServletContext().getRequestDispatcher("/inscription.jsp").forward(request, response);}else {

				//System.out.println("fffffffffffffffffffffffffffffff");
				String nom = request.getParameter("nom");
				String email = request.getParameter("email");
				String pass = request.getParameter("pass");
				String Confpass = request.getParameter("Confpass");
				String c=request.getParameter("ad");
				boolean g=false;
				if(c.equals("admin")) g=true;
				else    g=false;
				
			
				//System.out.println("--------_____________________________------" + Dao.UserExist(email));
				if (pass.equals(Confpass) && Dao.UserExist(email) == 0) {
					////System.out.println("--------_____________________________------" + Dao.UserExist(email));
					User user = new User();
					user.setEmail(email);
					user.setNomPre(nom);
					user.setPassWord(pass);
					user.setChoix(g);
					
					try {
						Dao.addUser(user);
					} catch (Exception e) {
						e.printStackTrace();
					}
					response.sendRedirect("login.jsp");
				} else if (pass.equals(Confpass) == false || Dao.UserExist(email) != 0) {
					////System.out.println("--------_existe deja------" + Dao.UserExist(email));
					response.sendRedirect("inscription.jsp");
			//		getServletContext().getRequestDispatcher("/inscription.jsp").forward(request, response);
					sission.setAttribute("erreur_Mot_pass",
							"  Mot de passe est incorrecte <br> ou l'email existe déjà. ");
					 

				}

			}  
				 
				
			 

		if (((String) sission.getAttribute("page")).equals("login")) {
			if (request.getParameter("email") == null || request.getParameter("pass") == null
					|| request.getParameter("email") == "" || request.getParameter("pass") == "" || request.getParameter("ad")==""  ) {
				//System.out.println("ööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööö");
				response.sendRedirect("login.jsp");
			} else {
				String a = request.getParameter("email"), b = request.getParameter("pass");
				String c=request.getParameter("ad");
				boolean g;
				if(c.equals("admin")) g=true;
				else    g=false;
				User uss = Dao.getUserByEmail(a, b,g);

				if (uss != null) {
					//System.out.println("---------------" + uss.getEmail() + "============" + uss.getPassWord());
					// if(uss!=null){

					sission.setAttribute("user", uss);
					//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
					response.sendRedirect("home.jsp");
				} else {
					response.sendRedirect("login.jsp");
					// getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);

				}

			}

		}

	}
}