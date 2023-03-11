const empresa = {};
import pool from '../database/conexion.js';

empresa.ConsultarTodasLasEmpresas = async () => {
   const [rows] = await pool.query("select e.id_empresa as id, e.fk_municipio as municipio, e.empresa, e.descripcion from empresa as e")
   
   return new Promise((resolve, reject) => {
     
      if (rows.length > 0) {
         return resolve(rows)
      } else {
         return reject("Fallo la consulta de todas la empresas")
      }
   });

 
}


export default empresa;