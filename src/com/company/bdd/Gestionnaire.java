package com.company.bdd;

import com.company.*;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;

public class Gestionnaire {

    private ArrayList<Bateau> batList = new ArrayList<>();
    private BateauVoyageur bateauvoy_Object;

    //execute une requête SELECT avec la requete donné en paramètre et retourne le résultat
    public ResultSet selectListeBateaux(){

        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marieteam", "root", "");
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery("SELECT bateau.idbateau, nom, largeur, longueur, vitesse FROM bateau, bateauvoyageur " +
                    "where bateau.idbateau = bateauvoyageur.idbateau");
            while (r.next()){

                Bateau bat = new Bateau(Integer.parseInt(r.getString(1))
                        , r.getString(2)
                        , r.getFloat(3)
                        , r.getFloat(4));

                batList.add(bat);

            }

            return r;

        }catch (SQLException | ClassNotFoundException ex){
            JOptionPane.showMessageDialog(null, "connexion impossible : " + ex.getMessage());
        }

        finally {
            try{
                if(conn != null){
                    conn.close();
                }
            }catch (SQLException ex){
                ex.printStackTrace();
            }
        }
        System.exit(0);

        return null;
    }

    public ResultSet selectBateauVoyageur(String nom){

        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marieteam", "root", "");
            Statement st_1 = conn.createStatement();
            Statement st_2 = conn.createStatement();
            ResultSet r = st_1.executeQuery("SELECT bateau.idbateau, nom, largeur, longueur, vitesse, image " +
                    "FROM bateau, bateauvoyageur " +
                    "where bateau.idbateau = bateauvoyageur.idbateau " +
                    "and bateau.nom =" + "'" + nom + "'" );

            ResultSet r_equip = st_2.executeQuery("SELECT idequipement, libelle FROM equipement, bateau " +
                    "where equipement.idbateau = bateau.idbateau and bateau.nom =" + "'" + nom + "'");

            ArrayList<Equipement> listEquip = new ArrayList<>();
            while (r_equip.next()){
                Equipement equip = new Equipement(r_equip.getInt(1), r_equip.getString(2));
                listEquip.add(equip);
            }

            while (r.next()){

                BateauVoyageur batvoy = new BateauVoyageur(r.getInt(1), r.getString(2),
                        r.getFloat(3), r.getFloat(4), r.getInt(5),
                        listEquip, r.getString(6));

                this.bateauvoy_Object = batvoy;

            }

            return r;

        }catch (SQLException | ClassNotFoundException ex){
            JOptionPane.showMessageDialog(null, "connexion impossible : " + ex.getMessage());
        }

        finally {
            try{
                if(conn != null){
                    conn.close();
                }
            }catch (SQLException ex){
                ex.printStackTrace();
            }
        }
        System.exit(0);

        return null;
    }

    public ArrayList<Bateau> getBatList(){
        return this.batList;
    }

    public BateauVoyageur getBateauvoyageur(){
        return this.bateauvoy_Object;
    }
}
