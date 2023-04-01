
import pool from '../database/conexion.js';

export default class Empresa {

   constructor() {
      this._obj_empresa = ""
   }

  
   ConsultarTodasLasEmpresas = async () => {
      const [rows] = await pool.query("select e.id_empresa as id, e.fk_municipio as municipio, e.empresa, e.descripcion from empresa as e")
      return rows 
   }
   get getTodasLasEmpresa() {
      return this._obj_empresa
   }

   set setTodasLasEmpresas(empresas) {
      this._obj_empresa = empresas
   }


} 